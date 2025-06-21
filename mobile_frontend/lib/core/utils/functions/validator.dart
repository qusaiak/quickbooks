
import '../../../config/constants.dart';
import '../../../l10n/app_localizations.dart';

class Validator {
  static String? validateGsm(String? value, context) {
    if (value!.isEmpty) {
      return AppLocalizations.of(context)!.empty_field_error_message;
    } else if (value.length < 10 || !value.startsWith("09")) {
      return AppLocalizations.of(context)!.invalid_mobile_number_error_message;
    }
    return null; // Return null if password meets all criteria
  }

  static String? validateEmail(String? value, context) {
    if (value!.isEmpty) {
      return AppLocalizations.of(context)!.empty_field_error_message;
    } else if (!value.endsWith("@gmail.com")) {
      return AppLocalizations.of(context)!.invalid_email_address_error_message;
    }
    return null; // Return null if password meets all criteria
  }

  static String? validatePassword(String? value, context) {
    if (value!.isEmpty) {
      return AppLocalizations.of(context)!.empty_field_error_message;
    } else if (value.length < 6) {
      return AppLocalizations.of(context)!.short_password_error_message;
    } else if (!RegExp(Constants.passwordRegex).hasMatch(value)) {
      return AppLocalizations.of(context)!.password_with_regex_error_message;
    }
    return null; // Return null if password meets all criteria
  }

  static String? validateConfirmPassword(
      String? value, String password, context) {
    if (value!.isEmpty) {
      return AppLocalizations.of(context)!.empty_field_error_message;
    } else if (value != password) {
      return AppLocalizations.of(context)!.password_confirmation_error_message;
    }
    return null; // Return null if password meets all criteria
  }

  static String? validateEmpty(String? value, context) {
    if (value!.isEmpty) {
      return AppLocalizations.of(context)!.empty_field_error_message;
    }
    return null; // Return null if password meets all criteria
  }

  static bool? validateCode(String code) {
    if (code.length < 4) {
      return false;
    }
    return true;
  }
}
