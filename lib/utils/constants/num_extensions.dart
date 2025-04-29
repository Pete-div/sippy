import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExtension on num {
  SizedBox get wi {
    return SizedBox(
      width: toDouble().w,
    );
  }

  SizedBox get hi {
    return SizedBox(
      height: toDouble().h,
    );
  }
}

extension SizedBoxExtension on Size {
  SizedBox get wh => SizedBox(
        width: width.w,
        height: height.h,
      );
}

extension IntExtension on int {
  String toOrdinal() {
    if ((this % 100) >= 11 && (this % 100) <= 13) {
      return '${this}th';
    }

    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }
}
