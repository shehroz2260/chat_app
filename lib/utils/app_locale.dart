import 'package:chat_app_1/constants/app_string.dart';
import 'package:get/get.dart';

class AppLocale extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_Us': {
          AppString.account: AppString.account,
          AppString.chats: AppString.chats,
          AppString.appereance: AppString.appereance,
          AppString.notification: AppString.notification,
          AppString.logOutText: AppString.logOutText,
          AppString.privacy: AppString.privacy,
          AppString.help: AppString.help,
          AppString.dataUsage: AppString.dataUsage
        },
        "ur_Pk": {
          AppString.account: "اکاؤنٹ",
          AppString.chats: "چیٹ",
          AppString.appereance: "ایپ تھیم",
          AppString.notification: 'اطلاع',
          AppString.logOutText: "لاگ آوٹ",
          AppString.privacy: "پرائیویسی",
          AppString.help: "ہیلپ",
          AppString.dataUsage: " ڈیٹایوزیج",
          AppString.security: "سیکورٹی",
          AppString.changeNumber: "نمبر تبدیل کریں",
          AppString.changeEmail: "ای میل تبدیل کریں",
          AppString.deleteMyAccount: "میرا اکاؤنٹ ڈیلیٹ کریں",
          AppString.archiveAllChats: "تمام چیٹس کو آرکائیو کریں",
          AppString.clearAllChats: "تمام چیٹس صاف کریں",
          AppString.deleteAllChats: "تمام چیٹس کو ڈیلیٹ کریں",
          AppString.appLanguage: "ایپ کی زبان",
          AppString.archived: "محفوظ شدہ",
          AppString.hideChat: "چیٹ چھپائیں",
          AppString.lightTheme: "لائٹ",
          AppString.darkTheme: "ڈارک",
          AppString.pinkerTheme: "پنکر",
          "Home": "ہوم",
          "Settings": "سیٹنگ",
          AppString.more: "مور"
        }
      };
}
