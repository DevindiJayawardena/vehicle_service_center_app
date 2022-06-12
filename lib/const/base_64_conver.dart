import 'dart:typed_data';

class Base64Convertor {
  static Uint8List? base64StringToBite(String? baseString) {
    if (baseString != null) {
      var uri = Uri.parse(baseString).data;
      return uri!.contentAsBytes();
    } else {
      return null;
    }
  }
}
