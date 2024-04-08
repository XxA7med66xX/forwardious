import 'dart:ui';

extension AujustUrl on String {
  ///Helps to remove the protocol name from url
  ///and reduce the length of characters if the
  ///url characters are more than 50.
  String adjustUrl() {
    if (length >= 50) {
      return replaceFirst(RegExp('^https?://'),'').replaceRange(15, length-20, '...');
    } else {
      return replaceFirst(RegExp('^https?://'),'');
    }
  }
}

extension StringToEnum on String {
  ///Converts the string value of [TextDirection]
  ///that comes from [SharedPreferences] to an [Enum]
  ///representing a [TextDirection] value.
  TextDirection convert() {
    return contains('rtl') ? TextDirection.rtl : TextDirection.ltr;
  }
}
