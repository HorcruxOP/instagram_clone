import 'package:flutter/material.dart';

const String _fontfamily = "IGsans";
const String _fontfamilyCondensed = "IGsansCondensed";

class CustomFontStyle {
  static TextStyle lightText = const TextStyle(
    fontFamily: _fontfamily,
    fontWeight: FontWeight.w300,
  );
  static TextStyle mediumText = const TextStyle(
    fontFamily: _fontfamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle regularText = const TextStyle(
    fontFamily: _fontfamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle boldText = const TextStyle(
    fontFamily: _fontfamily,
    fontWeight: FontWeight.w700,
  );
  static TextStyle condensedBoldText = const TextStyle(
    fontFamily: _fontfamilyCondensed,
    fontWeight: FontWeight.w700,
  );
  static TextStyle condensedRegularText = const TextStyle(
    fontFamily: _fontfamilyCondensed,
    fontWeight: FontWeight.w400,
  );
}
