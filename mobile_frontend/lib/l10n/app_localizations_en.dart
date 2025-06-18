// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get helloWorld => 'Hello World!';

  @override
  String hello(String username) {
    return 'Hi $username';
  }

  @override
  String get welcome => 'Welcome';

  @override
  String get action_settings => 'Settings';

  @override
  String get no_results_found => 'No Results Found';

  @override
  String get home_page => 'Home';

  @override
  String get setting => 'Settings';

  @override
  String get btn_edit => 'Edit';

  @override
  String get txt_app_lang => 'Application Language';

  @override
  String get txt_notification_setting => 'Push Notifications';

  @override
  String get txt_logout => 'Logout';

  @override
  String get dialog_change_language_title => 'Change language';

  @override
  String get btn_continue => 'Continue';

  @override
  String get help_text_1 => 'Your all-in-one solution for booking appointments, tables, lessons, and more—fast and easy.';

  @override
  String get help_text_2 => 'With QuickBooks, you can find and book the services you need in just a few taps.';

  @override
  String get help_text_3 => 'Get instant confirmations, reminders, and manage your schedule effortlessly.';

  @override
  String get create_account => 'Create an account';

  @override
  String get change_password => 'Change Password';

  @override
  String get reset_password => 'Reset Password';

  @override
  String get hint_confirm_password => 'Confirm Password';

  @override
  String get txt_old_password => 'Old Password';

  @override
  String get txt_new_password => 'New Password';

  @override
  String get btn_save => 'Save';

  @override
  String get verify_account => 'Account Verification';

  @override
  String get txt_first_name => 'First Name';

  @override
  String get txt_last_name => 'Last Name';

  @override
  String get txt_gender => 'Gender';

  @override
  String get txt_male => 'Male';

  @override
  String get txt_female => 'Female';

  @override
  String get txt_date_of_birth => 'Date of Birth';

  @override
  String get date_format => 'dd/MM/yyyy';

  @override
  String get txt_english => 'English';

  @override
  String get txt_arabic => 'Arabic';

  @override
  String get my_profile => 'My Profile';

  @override
  String get edit_profile => 'Edit Profile';

  @override
  String get dialog_error_ok => 'OK';

  @override
  String get error_empty_input_field => 'Please make sure to fill all fields.';

  @override
  String get error_empty_gsm => 'Please add your GSM';

  @override
  String get msg_operation_failed => 'Something went wrong. Please try again later';

  @override
  String get txt_cancel => 'Cancel';

  @override
  String get error_action_retry => 'Retry';

  @override
  String get action_save => 'Save';

  @override
  String get dialog_log_out_body => 'Do you want to logout now?';

  @override
  String get btn_continue_txt => 'OK';

  @override
  String get btn_cancel => 'Cancel';

  @override
  String get btn_yes_txt => 'Yes';

  @override
  String get btn_no_txt => 'No';

  @override
  String get error_server => 'Server Error';

  @override
  String get error_connection => 'Please check your internet connection';

  @override
  String get ok => 'OK';

  @override
  String get skip => 'Skip';

  @override
  String get login => 'Login';

  @override
  String get mobile_number => 'Mobile Number';

  @override
  String get password => 'Password';

  @override
  String get register => 'Register';

  @override
  String get successful_login_message => 'Login Successfully';

  @override
  String get successful_registration_message => 'Account Registered Successfully';

  @override
  String get personal_details => 'Personal Details';

  @override
  String get do_not_have_an_account => 'Don\'t have an account? ';

  @override
  String get invalid_mobile_number_error_message => 'Please enter a valid mobile number';

  @override
  String get empty_field_error_message => 'This field is required';

  @override
  String get forget_password => 'Forgot password?';

  @override
  String get already_a_user => 'Already a user? ';

  @override
  String get short_password_error_message => 'password must be at least 6 characters';

  @override
  String get password_with_regex_error_message => 'password must contain at least 1 letter and 1 number';

  @override
  String get password_confirmation_error_message => 'Confirm password does not match password';

  @override
  String get verify_account_action => 'Verify Account';

  @override
  String get action_reset => 'Reset';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get appearance => 'Appearance';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get system => 'System';

  @override
  String get application_appearance => 'Application Appearance';

  @override
  String get password_changed => 'Password Changed';

  @override
  String get profile_edited => 'Profile Edited';

  @override
  String get or => 'OR';

  @override
  String get did_not_receive_code => 'Didn\'t receive code? ';

  @override
  String get resend_code => 'Resend code';
}
