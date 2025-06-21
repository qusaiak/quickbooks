import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// The current Language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// A programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// A welcome message
  ///
  /// In en, this message translates to:
  /// **'Hi {username}'**
  String hello(String username);

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @action_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get action_settings;

  /// No description provided for @no_results_found.
  ///
  /// In en, this message translates to:
  /// **'No Results Found'**
  String get no_results_found;

  /// No description provided for @home_page.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home_page;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get setting;

  /// No description provided for @btn_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get btn_edit;

  /// No description provided for @txt_app_lang.
  ///
  /// In en, this message translates to:
  /// **'Application Language'**
  String get txt_app_lang;

  /// No description provided for @txt_notification_setting.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get txt_notification_setting;

  /// No description provided for @txt_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get txt_logout;

  /// No description provided for @dialog_change_language_title.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get dialog_change_language_title;

  /// No description provided for @btn_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get btn_continue;

  /// No description provided for @help_text_1.
  ///
  /// In en, this message translates to:
  /// **'Your all-in-one solution for booking appointments, tables, lessons, and more—fast and easy.'**
  String get help_text_1;

  /// No description provided for @help_text_2.
  ///
  /// In en, this message translates to:
  /// **'With QuickBooks, you can find and book the services you need in just a few taps.'**
  String get help_text_2;

  /// No description provided for @help_text_3.
  ///
  /// In en, this message translates to:
  /// **'Get instant confirmations, reminders, and manage your schedule effortlessly.'**
  String get help_text_3;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get create_account;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @hint_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get hint_confirm_password;

  /// No description provided for @txt_old_password.
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get txt_old_password;

  /// No description provided for @txt_new_password.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get txt_new_password;

  /// No description provided for @btn_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get btn_save;

  /// No description provided for @verify_account.
  ///
  /// In en, this message translates to:
  /// **'Account Verification'**
  String get verify_account;

  /// No description provided for @txt_first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get txt_first_name;

  /// No description provided for @txt_last_name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get txt_last_name;

  /// No description provided for @txt_email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get txt_email;

  /// No description provided for @txt_gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get txt_gender;

  /// No description provided for @txt_male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get txt_male;

  /// No description provided for @txt_female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get txt_female;

  /// No description provided for @txt_date_of_birth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get txt_date_of_birth;

  /// No description provided for @date_format.
  ///
  /// In en, this message translates to:
  /// **'dd/MM/yyyy'**
  String get date_format;

  /// No description provided for @txt_english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get txt_english;

  /// No description provided for @txt_arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get txt_arabic;

  /// No description provided for @my_profile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get my_profile;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile;

  /// No description provided for @dialog_error_ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get dialog_error_ok;

  /// No description provided for @error_empty_input_field.
  ///
  /// In en, this message translates to:
  /// **'Please make sure to fill all fields.'**
  String get error_empty_input_field;

  /// No description provided for @error_empty_gsm.
  ///
  /// In en, this message translates to:
  /// **'Please add your GSM'**
  String get error_empty_gsm;

  /// No description provided for @msg_operation_failed.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again later'**
  String get msg_operation_failed;

  /// No description provided for @txt_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get txt_cancel;

  /// No description provided for @error_action_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get error_action_retry;

  /// No description provided for @action_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get action_save;

  /// No description provided for @dialog_log_out_body.
  ///
  /// In en, this message translates to:
  /// **'Do you want to logout now?'**
  String get dialog_log_out_body;

  /// No description provided for @btn_continue_txt.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get btn_continue_txt;

  /// No description provided for @btn_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get btn_cancel;

  /// No description provided for @btn_yes_txt.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get btn_yes_txt;

  /// No description provided for @btn_no_txt.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get btn_no_txt;

  /// No description provided for @error_server.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get error_server;

  /// No description provided for @error_connection.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get error_connection;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobile_number;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @successful_login_message.
  ///
  /// In en, this message translates to:
  /// **'Login Successfully'**
  String get successful_login_message;

  /// No description provided for @successful_registration_message.
  ///
  /// In en, this message translates to:
  /// **'Account Registered Successfully'**
  String get successful_registration_message;

  /// No description provided for @personal_details.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personal_details;

  /// No description provided for @do_not_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get do_not_have_an_account;

  /// No description provided for @invalid_mobile_number_error_message.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid mobile number'**
  String get invalid_mobile_number_error_message;

  /// No description provided for @invalid_email_address_error_message.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalid_email_address_error_message;

  /// No description provided for @empty_field_error_message.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get empty_field_error_message;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forget_password;

  /// No description provided for @already_a_user.
  ///
  /// In en, this message translates to:
  /// **'Already a user? '**
  String get already_a_user;

  /// No description provided for @short_password_error_message.
  ///
  /// In en, this message translates to:
  /// **'password must be at least 6 characters'**
  String get short_password_error_message;

  /// No description provided for @password_with_regex_error_message.
  ///
  /// In en, this message translates to:
  /// **'password must contain at least 1 letter and 1 number'**
  String get password_with_regex_error_message;

  /// No description provided for @password_confirmation_error_message.
  ///
  /// In en, this message translates to:
  /// **'Confirm password does not match password'**
  String get password_confirmation_error_message;

  /// No description provided for @verify_account_action.
  ///
  /// In en, this message translates to:
  /// **'Verify Account'**
  String get verify_account_action;

  /// No description provided for @action_reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get action_reset;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @application_appearance.
  ///
  /// In en, this message translates to:
  /// **'Application Appearance'**
  String get application_appearance;

  /// No description provided for @password_changed.
  ///
  /// In en, this message translates to:
  /// **'Password Changed'**
  String get password_changed;

  /// No description provided for @profile_edited.
  ///
  /// In en, this message translates to:
  /// **'Profile Edited'**
  String get profile_edited;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @did_not_receive_code.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code? '**
  String get did_not_receive_code;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resend_code;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
