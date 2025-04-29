import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtension on Widget {
  /// Adds padding to the widget with all sides having the same padding value.
  Widget padAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding.w),
      child: this, // 'this' refers to the current widget.
    );
  }

  /// Adds horizontal padding to the widget.
  Widget padHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: this,
    );
  }

  /// Adds vertical padding to the widget.
  Widget padVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding.w),
      child: this,
    );
  }

  /// Adds symmetric padding to the widget.
  Widget padSymmetric({double vertical = 0, double horizontal = 0}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: vertical.w, horizontal: horizontal.w),
      child: this,
    );
  }

  /// Adds left padding to the widget.
  Widget padLeft(double padding) {
    return Padding(
      padding: EdgeInsets.only(left: padding.w),
      child: this,
    );
  }

  /// Adds right padding to the widget.
  Widget padRight(double padding) {
    return Padding(
      padding: EdgeInsets.only(right: padding.w),
      child: this,
    );
  }

  /// Adds top padding to the widget.
  Widget padTop(double padding) {
    return Padding(
      padding: EdgeInsets.only(top: padding.w),
      child: this,
    );
  }

  /// Adds bottom padding to the widget.
  Widget padBottom(double padding) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding.w),
      child: this,
    );
  }

  Widget padOnly({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left?.w ?? 0,
        right: right?.w ?? 0,
        top: top?.w ?? 0,
        bottom: bottom?.w ?? 0,
      ),
      child: this,
    );
  }
}
