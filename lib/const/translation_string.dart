import 'package:get/get_navigation/src/root/internacionalization.dart';

class TranslationString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "language": "English",
          "home": "Home",
          "requests": "Requests",
        },
        "si_LK": {
          "language": "සිංහල",
          "home": "මුල් පිටුව",
          "requests": "ඉල්ලීම්",
        },
      };
}
