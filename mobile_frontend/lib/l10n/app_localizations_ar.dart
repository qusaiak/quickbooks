// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get language => 'اللغة';

  @override
  String get helloWorld => 'مرحبا عالم!';

  @override
  String hello(String username) {
    return ' مرحبا $username';
  }

  @override
  String get welcome => 'أهلا';

  @override
  String get action_settings => 'الإعدادات';

  @override
  String get no_results_found => 'لم يتم العثور على نتائج';

  @override
  String get home_page => 'الصفحة الرئيسية';

  @override
  String get setting => 'الإعدادات';

  @override
  String get btn_edit => 'تعديل';

  @override
  String get txt_app_lang => 'اللغة';

  @override
  String get txt_notification_setting => 'الإشعارات';

  @override
  String get txt_logout => 'تسجيل الخروج';

  @override
  String get dialog_change_language_title => 'تغيير اللغة';

  @override
  String get btn_continue => 'استمرار';

  @override
  String get help_text_1 => 'الحل الشامل لحجز المواعيد والطاولات والدروس والمزيد - سريع وسهل.';

  @override
  String get help_text_2 => 'مع QuickBooks، يمكنك العثور على الخدمات التي تحتاجها وحجزها ببضع نقرات فقط';

  @override
  String get help_text_3 => 'احصل على تأكيدات فورية وتذكيرات وقم بإدارة جدولك بسهولة.';

  @override
  String get create_account => 'إنشاء حساب';

  @override
  String get change_password => 'تغيير كلمة المرور';

  @override
  String get reset_password => 'إعادة تعيين كلمة المرور';

  @override
  String get hint_confirm_password => 'تأكيد كلمة المرور';

  @override
  String get txt_old_password => 'كلمة المرور القديمة ';

  @override
  String get txt_new_password => 'كلمة المرور الجديدة';

  @override
  String get btn_save => 'حفظ';

  @override
  String get verify_account => 'تأكيد الحساب';

  @override
  String get txt_first_name => 'الاسم الأول';

  @override
  String get txt_last_name => 'الاسم الأخير';

  @override
  String get txt_email => 'البريد الإالكتروني';

  @override
  String get txt_gender => 'الجنس';

  @override
  String get txt_male => 'ذكر';

  @override
  String get txt_female => 'أنثى';

  @override
  String get txt_date_of_birth => 'تاريخ الميلاد';

  @override
  String get date_format => 'يوم/شهر/سنة';

  @override
  String get txt_english => 'اللغة الإنكليزية';

  @override
  String get txt_arabic => 'اللغة العربية';

  @override
  String get my_profile => 'الملف الشخصي';

  @override
  String get edit_profile => 'تعديل الملف الشخصي';

  @override
  String get dialog_error_ok => 'موافق';

  @override
  String get error_empty_input_field => 'يرجى التأكد من ملء كل الحقول.';

  @override
  String get error_empty_gsm => 'يرجى إضافة رقم الخلوي';

  @override
  String get msg_operation_failed => 'حدث خطأ ما. يرجى المحاولة لاحقاً';

  @override
  String get txt_cancel => 'الغاء';

  @override
  String get error_action_retry => 'إعادة المحاولة';

  @override
  String get action_save => 'حفظ';

  @override
  String get dialog_log_out_body => 'هل تريد تسجل الخروج الأن؟';

  @override
  String get btn_continue_txt => 'OK';

  @override
  String get btn_cancel => 'Cancel';

  @override
  String get btn_yes_txt => 'نعم';

  @override
  String get btn_no_txt => 'لا';

  @override
  String get error_server => 'خطأ في المخدم';

  @override
  String get error_connection => 'يرجى التحقق من الإتصال بالإنترنت';

  @override
  String get ok => 'تم';

  @override
  String get skip => 'تخطي';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get mobile_number => 'رقم الموبايل';

  @override
  String get password => 'كلمة المرور';

  @override
  String get register => 'إنشاء حساب';

  @override
  String get successful_login_message => 'تم تسجيل الدخول بنجاح';

  @override
  String get successful_registration_message => 'تم إنشاء الحساب بنجاح';

  @override
  String get personal_details => 'معلومات شخصية';

  @override
  String get do_not_have_an_account => 'ليس لديك حساب؟';

  @override
  String get invalid_mobile_number_error_message => 'الرجاء إدخال رقم موبايل صحيح';

  @override
  String get invalid_email_address_error_message => 'الرجاء إدخال بريد إلكتروني صحيح';

  @override
  String get empty_field_error_message => 'هذا الحقل مطلوب';

  @override
  String get forget_password => 'نسيت كلمة المرور؟';

  @override
  String get already_a_user => 'لديك حساب؟';

  @override
  String get short_password_error_message => 'كلمة المرور يجب أن تكون 6 محارف على الأقل';

  @override
  String get password_with_regex_error_message => 'كلمة المرور يجب أن تحتوي حرف واحد ورقم واحد على الأقل';

  @override
  String get password_confirmation_error_message => 'تأكيد كلمة المرور لا يطابق كلمة المرور';

  @override
  String get verify_account_action => 'Verify Account';

  @override
  String get action_reset => 'تغيير';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get appearance => 'المظهر';

  @override
  String get dark => 'مظلم';

  @override
  String get light => 'مضيء';

  @override
  String get system => 'النظام';

  @override
  String get application_appearance => 'مظهر التطبيق';

  @override
  String get password_changed => 'تم تغيير كلمة المرور';

  @override
  String get profile_edited => 'تم تعديل الحساب';

  @override
  String get or => 'أو';

  @override
  String get did_not_receive_code => 'لم يصلك الرمز؟';

  @override
  String get resend_code => 'إعادة إرسال الرمز';
}
