const crypto = require('crypto');
const jwt = require('jsonwebtoken');
const User = require('./../models/userModel');
const catchAsync = require('./../utils/catchAsync');
const AppError = require('./../utils/appError');
const sendEmail = require('../utils/sendEmail');

const blacklistedTokens = new Set();

const signToken = id => {
    return jwt.sign({ id }, process.env.JWT_SECRET, {
        expiresIn: process.env.JWT_EXPIRES_IN
    });
}

const createSendToken = (user, statusCode, res) => {
    const token = signToken(user._id);

    const cookieOptions = {
        expires: new Date(Date.now() + process.env.JWT_COOKIE_EXPIRES_IN * 24 * 60 * 60 * 1000
    ),
    httpOnly: true
    };

    if(process.env.NODE_ENV === 'production' ) cookieOptions.secure = true;

    res.cookie('jwt', token, cookieOptions);

    // Remove password from output
    user.password = undefined;

    res.status(statusCode).json({
        status: 200,
        data: {
            token: token,
            user
        }
    });
}

exports.signup = catchAsync(async (req, res, next) => {
    const existingUser = await User.findOne({ email: req.body.email });
if (existingUser) {
  return res.status(400).json({
    status: 400,
    message: 'Email already in use. Please try another one.'
  });
} else {
    const newUser = await User.create(req.body);

    createSendToken(newUser, 201, res);
}
});

exports.login = catchAsync(async(req, res, next) => {
    const { email, password } = req.body;

    // 1) Check if email and password exist
    if(!email || !password) {
        return next(new AppError('Please provide email and password!', 400));
    }

    // 2) Check if user exists & password is correct
    const user = await User.findOne({ email }).select('+password');
    const correct = await user.correctPassword(password, user.password);

    if(!user || !correct) {
        return next(new AppError('Incorrect email or password', 401));
    }
    
    // 3) If everything ok, send to ken to client
    createSendToken(user, 200, res);
});

exports.logout = (req, res) => {
    let token;

    if (
        req.headers.authorization && 
        req.headers.authorization.startsWith('Bearer')
    ) {
        token = req.headers.authorization.split(' ')[1];
    } else if (req.cookies.jwt) {
        token = req.cookies.jwt;
    }

    if (token) {
        blacklistedTokens.add(token);
    }

    res.cookie('jwt', 'loggedout', {
        expires: new Date(Date.now() + 10 * 1000),
        httpOnly: true,
        secure: process.env.NODE_ENV === 'production'
    });

    res.status(200).json({ status: 200, message: 'Logged out and token blacklisted!' });
};


exports.protect = catchAsync(async (req, res, next) => {
    // 1) Check if token exist, if exist get
    let token;

    if(
        req.headers.authorization
        && req.headers.authorization.startsWith('Bearer')
    ) {
        token = req.headers.authorization.split(' ')[1];
    } else if (req.cookies.jwt) {
        token = req.cookies.jwt;
    }

    if(!token) {
        return next(new AppError('You are not login, Please login to access this route', 401))
    }

    // 🔒 Check blacklist
    if (blacklistedTokens.has(token)) {
        return next(
            new AppError('This token has been blacklisted. Please log in again.', 401)
        );
    }

    // 2) Verify token (no change happens, expired token)
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    
    // 3) Check if user exists
    const currentUser = await User.findById(decoded.id);
    if (!currentUser) {
        return next(new AppError('The user belonging to this token no longer exists.', 401));
    }

    // 4) Check if user change his password after token created
    if(currentUser.passwordChangedAt) {
        const passswordChangedTimeStamp = parseInt(currentUser.passwordChangedAt.getTime() / 1000, 10);
        // Password changed after token 
        if(passswordChangedTimeStamp > decoded.iat) {
            return next(new AppError('User recently changed his password. please login again...', 401));
        } 
    }
    req.user = currentUser;
    next();

});

exports.restrictTo = (...roles) => {
    return (req, res, next) => {
        // roles ['client', 'admin', 'provider', 'reception', 'guest']
        if(!roles.includes(req.user.role)) {
            return next(new AppError('You do not have permission to perform this action', 403))
        }
        next();
    };
};

exports.forgotPassword = catchAsync(async (req, res, next) => {
    // 1) Get user by email
    const user = await User.findOne({ email: req.body.email });
    if(!user) {
        return next(
            new AppError(`There is no users with that email ${req.body.email}`, 404)
        );
    }

    // 2) If user exist, Generate hash reset random 6 digits and save it In db

    // Use role to determine OTP length: 4 digits for client, 6 for others
    const otpLength = user.role === 'client' ? 4 : 6;

    // Generate OTP of appropriate length
    const otp = Math.floor(
        Math.pow(10, otpLength - 1) + Math.random() * 9 * Math.pow(10, otpLength - 1)
    ).toString();

    const hashedOtp = crypto.
    createHash('sha256')
    .update(otp)
    .digest('hex');

    // Save password reset code into db
    user.passwordResetCode = hashedOtp;
    // Add expieration time for password reset code (10 min)
    user.passwordResetExpires = Date.now() + 10 * 60 * 1000;
    user.passwordResetVerified = false;

    await user.save({ validateBeforeSave: false });

    const message = `Hi ${user.firstName}, 
    \n We recieved a request to reset the password on your QuickBooks Account. 
    \n ${otp} \n Enter this code to complete the reset 
    \n Thanks for helping us keep your account secure
    \n The QuickBooks Team `;

    // 3) Send the reset code via email
    try {
        await sendEmail({ 
        email: user.email, 
        subject: 'Your password reset code (valid for 10 min)',
        message: message
     });
    } catch(err) {
        user.passwordResetCode = undefined;
        user.passwordResetExpires = undefined;
        user.passwordResetVerified = undefined;

        await user.save();
        return next(new AppError('There is an error in sending email', 500));
    }

     res.status(200).json({
        status: 200,
        message: 'Reset code send to email'
     });
});

// exports.verifyOtp = catchAsync(async(req, res, next) => {
//     const hashedOtp = crypto
//         .createHash('sha256')
//         .update(req.body.otp)
//         .digest('hex');

//     const user = await User.findOne({ 
//         passwordResetCode: hashedOtp,
//         passwordResetExpires: { $gt: Date.now() },
//     });

//     if (!user) {
//         return next(new AppError('Reset code invalid or expired'));
//     }

//     user.passwordResetVerified = true;
//     await user.save({ validateBeforeSave: false });

//     res.status(200).json({
//         status: 200,
//         message: 'OTP verified successfully',
//         userId: user._id  // نعيد معرف المستخدم لاستخدامه في resetPassword
//     });
// });

exports.verifyOtp = catchAsync(async(req, res, next) => {
    const hashedOtp = crypto
        .createHash('sha256')
        .update(req.body.otp)
        .digest('hex');

    const user = await User.findOne({ 
        passwordResetCode: hashedOtp,
        passwordResetExpires: { $gt: Date.now() },
    });

    if (!user) {
        return next(new AppError('Reset code invalid or expired'));
    }

    user.passwordResetVerified = true;
    await user.save({ validateBeforeSave: false });

    // Generate token for 10 min, to determine user in next api
    const tempToken = jwt.sign(
        { id: user._id },
        process.env.JWT_SECRET,
        { expiresIn: '10m' }
    );

    res.status(200).json({
        status: 200,
        message: 'OTP verified successfully',
        token: tempToken
    });
});

exports.resetPassword = catchAsync(async (req, res, next) => {
    const { newPassword, confirmPassword } = req.body;

    if (!newPassword || !confirmPassword) {
        return next(new AppError('Please provide newPassword and confirmPassword', 400));
    }

    if (newPassword !== confirmPassword) {
        return next(new AppError('Passwords do not match', 400));
    }

    const authHeader = req.headers.authorization;
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        return next(new AppError('Authorization token missing', 401));
    }

    const token = authHeader.split(' ')[1];

    let decoded;
    try {
        decoded = jwt.verify(token, process.env.JWT_SECRET);
    } catch (err) {
        return next(new AppError('Token invalid or expired', 401));
    }

    const user = await User.findById(decoded.id);
    if (!user) {
        return next(new AppError('User not found', 404));
    }

    if (!user.passwordResetVerified) {
        return next(new AppError('Reset code not verified', 400));
    }

    user.password = newPassword;
    user.passwordResetCode = undefined;
    user.passwordResetExpires = undefined;
    user.passwordResetVerified = undefined;

    await user.save({ validateBeforeSave: false });

    const finalToken = signToken(user._id);
    res.status(200).json({ token: finalToken });
});


exports.test = catchAsync(async(req, res, next) => {
    res.status(200).json({
        message: 'sssssssss'
    })
})



exports.changeMyPassword = catchAsync(async(req, res, next) => {
    // 1) Get user from collection
    const user = await User.findById(req.user._id).select('+password');

    // 2) Check if POSTed current password is correct
    if (!(await user.correctPassword(req.body.passwordCurrent, user.password))) {
        return next(new AppError('Your current password is wrong', 401));
    }

    // 3) If so, update password
    user.password = req.body.password;
    user.passwordConfirm = req.body.passwordConfirm;
    await user.save();
    //User.findByIdAndUpdate will Not work as intended!

    // 4) Log user in, send JWT
    createSendToken(user, 200, res);
});