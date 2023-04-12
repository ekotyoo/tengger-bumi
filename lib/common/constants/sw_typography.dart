import 'package:flutter/material.dart';
import 'package:school_watch_semeru/common/constants/sw_colors.dart';

extension on TextStyle {
  TextStyle bold() => copyWith(fontWeight: FontWeight.bold);
}

const kTypoHeading1 = TextStyle(
  fontFamily: "quicksand",
  fontSize: 32,
  fontWeight: FontWeight.w400,
  color: kColorNeutral900,
);
final kTypoHeading1Bold = kTypoHeading1.bold();

const kTypoHeading2 = TextStyle(
  fontFamily: "quicksand",
  fontSize: 28,
  fontWeight: FontWeight.w400,
  color: kColorNeutral900,
);
final kTypoHeading2Bold = kTypoHeading2.bold();

const kTypoHeading3 = TextStyle(
  fontFamily: "quicksand",
  fontSize: 25,
  fontWeight: FontWeight.w400,
  color: kColorNeutral900,
);
final kTypoHeading3Bold = kTypoHeading3.bold();

const kTypoHeading4 = TextStyle(
  fontFamily: "quicksand",
  fontSize: 22,
  fontWeight: FontWeight.w400,
  color: kColorNeutral900,
);
final kTypoHeading4Bold = kTypoHeading4.bold();

const kTypoHeading5 = TextStyle(
  fontFamily: "quicksand",
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: kColorNeutral900,
);
final kTypoHeading5Bold = kTypoHeading5.bold();

const kTypoHeading6 = TextStyle(
  fontFamily: "quicksand",
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: kColorNeutral900,
);
final kTypoHeading6Bold = kTypoHeading6.bold();

const kTypoTitle = TextStyle(
  fontFamily: "quicksand",
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: kColorNeutral900,
);
final kTypoTitleBold = kTypoTitle.bold();

const kTypoBody = TextStyle(
  fontFamily: "quicksand",
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: kColorNeutral900,
);
final kTypoBodyBold = kTypoBody.bold();

const kTypoCaption1 = TextStyle(
  fontFamily: "quicksand",
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: kColorNeutral900,
);
final kTypoCaption1Bold = kTypoCaption1.bold();

const kTypoCaption2 = TextStyle(
  fontFamily: "quicksand",
  fontSize: 11,
  fontWeight: FontWeight.w400,
  color: kColorNeutral900,
);
final kTypoCaption2Bold = kTypoCaption2.bold();
