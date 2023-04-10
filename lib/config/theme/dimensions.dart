import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class Dimensions {
  //padding
  static final kPaddingAllLargest = const EdgeInsets.all(50.0).w;
  static final kPaddingAllLarger = const EdgeInsets.all(30.0).w;
  static final kPaddingAllLarge = const EdgeInsets.all(20.0).w;
  static final kPaddingAllMedium = const EdgeInsets.all(10.0).w;
  static final kPaddingAllSmall = const EdgeInsets.all(8.0).w;

  static final kPaddingSymetricHorizontal = const EdgeInsets.symmetric(
    horizontal: 20.0,
  ).w;

  static final kPaddingSymetricVertical = const EdgeInsets.symmetric(
    vertical: 20.0,
  ).w;

  static final kPaddingNavBottom = const EdgeInsets.all(16.0).w;
  static const kPaddingSearchTextField = EdgeInsetsDirectional.all(12.0);

  //BorderRadius
  static final kBorderRadiusAllLarger = BorderRadius.circular(50).w;
  static final kBorderRadiusAllLarge = BorderRadius.circular(30).w;
  static final kBorderRadiusAllMedium = BorderRadius.circular(20).w;
  static final kBorderRadiusAllSmall = BorderRadius.circular(16).w;
  static final kBorderRadiusAllSmallest = BorderRadius.circular(10).w;

  //VerticalSpace
  static final kVerticalSpaceLargest = SizedBox(height: 100.h);
  static final kVerticalSpaceLarger = SizedBox(height: 50.h);
  static final kVerticalSpaceLarge = SizedBox(height: 30.h);
  static final kVerticalSpaceMedium = SizedBox(height: 20.h);
  static final kVerticalSpaceSmall = SizedBox(height: 16.h);
  static final kVerticalSpaceSmaller = SizedBox(height: 10.h);
  static final kVerticalSpaceSmallest = SizedBox(height: 8.h);

  //Horizontal Space
  static final kHorizontalSpaceLargest = SizedBox(width: 30.w);
  static final kHorizontalSpaceLarger = SizedBox(width: 24.w);
  static final kHorizontalSpaceLarge = SizedBox(width: 20.w);
  static final kHorizontalSpaceMedium = SizedBox(width: 16.w);
  static final kHorizontalSpaceSmall = SizedBox(width: 10.w);
  static final kHorizontalSpaceSmaller = SizedBox(width: 8.w);

  //Screen Size
  static final kScreenWidth50 = 0.5.sw;
  static final kScreenHeight50 = 0.5.sh;
  static final kScreenHeight40 = 0.4.sh;
  static final kQuoteTextSettingHeight = 0.055.sh;

  // Size
  static final double iconSizeLargest = 80.h;
  static final double iconSizeLarger = 48.h;
  static final double iconSizeLarge = 36.h;
  static final double iconSizeMedium = 30.h;
  static final double iconSizeSmall = 24.h;

  static final double sizeLargest = 50.h;
  static final double sizeLarger = 20.h;
  static final double sizeLarge = 18.h;
  static final double sizeMedium = 16.h;
  static final double sizeSmall = 12.h;
  static final double sizeSmaller = 8.h;
  static final double sizeSmallest = 6.h;

  //Color palette size
  static final double colorPaletteWidth = 44.w;
  static final double colorPaletteHight = 44.h;
  static final double colorPaleteBorder = 22.h;

  //Quote Text Word Spacing
  static final double quoteTextWordSpacingLarge = 12.w;
  static final double quoteTextWordSpacingMedium = 9.w;
  static final double quoteTextWordSpacingSmall = 6.w;
  static final double quoteTextWordSpacingNone = 0.w;

  //Quote Text letter Spacing
  static final double quoteTextLetterSpacingLarge = 10.w;
  static final double quoteTextLetterSpacingMedium = 6.w;
  static final double quoteTextLetterSpacingSmall = 3.w;
  static final double quoteTextLetterSpacingNone = 0.w;

  //Quote Text font size
  static final double quoteTextFontSizeLarge = 24.sp;
  static final double quoteTextFontSizeMedium = 20.sp;
  static final double quoteTextFontSizeSmall = 16.sp;
}
