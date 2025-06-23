const express = require('express');
// const userController = require('./../controllers/userController');
const authController = require('../controllers/authController');

const router = express.Router();

router.post('/signup', authController.signup);
router.post('/login', authController.login);
router.get('/logout', authController.logout);
router.post('/forgotPassword', authController.forgotPassword);
router.post('/verifyResetCode', authController.verifyOtp);
router.patch('/resetPassword', authController.resetPassword);
router.patch('/changeMyPassword', authController.protect, authController.changeMyPassword);
router.get('/get',authController.protect, authController.test);



module.exports = router;