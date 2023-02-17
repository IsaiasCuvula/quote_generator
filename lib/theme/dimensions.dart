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

  //BorderRadius
  static final kBorderRadiusAllLarger = BorderRadius.circular(50).w;
  static final kBorderRadiusAllLarge = BorderRadius.circular(30).w;
  static final kBorderRadiusAllMedium = BorderRadius.circular(20).w;
  static final kBorderRadiusAllSmall = BorderRadius.circular(16).w;

  //VerticalSpace
  static final kVerticalSpaceLargest = SizedBox(height: 100.h);
  static final kVerticalSpaceLarger = SizedBox(height: 50.h);
  static final kVerticalSpaceLarge = SizedBox(height: 30.h);
  static final kVerticalSpaceMedium = SizedBox(height: 20.h);
  static final kVerticalSpaceSmall = SizedBox(height: 10.h);
  static final kVerticalSpaceSmaller = SizedBox(height: 8.h);

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

  // Size
  static final double iconSizeLarger = 48.h;
  static final double iconSizeLarge = 36.h;
  static final double iconSizeMedium = 30.h;
  static final double iconSizeSmall = 24.h;
}
