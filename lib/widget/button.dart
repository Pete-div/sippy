import 'package:flutter/material.dart';
import 'package:sippy/utils/colors.dart';
import 'package:sippy/widget/texts.dart';

class XButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Function onClick;
  final String? text;
  final double? radius;
  final Color? buttonColor;
  final Color? textColor;
  final bool isLoading;
  final Color? progressColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final bool isOutline;
  final Color? borderColor;
  final bool? hasShadow;
  final Widget? buttonWidget;

  const XButton({
    Key? key,
    required this.onClick,
    required this.text,
    this.height,
    this.width,
    this.radius,
    this.buttonColor,
    this.textColor,
    this.isLoading = false,
    this.progressColor,
    this.textSize,
    this.hasShadow = false,
    this.fontWeight,
    this.isOutline = false,
    this.borderColor,
    this.buttonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isOutline
        ? TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  buttonColor ?? appColors.background),
              elevation: MaterialStateProperty.all(0),
              minimumSize: MaterialStateProperty.all(Size(width ?? 300, height ?? 56)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 28),
                ),
              ),
            ),
            child: NormalText(
                     text ?? 'Continue',
                    color:textColor ?? appColors.white,
                    weight: FontWeight.bold,
                    size: textSize ?? 15,
                  ),
             
            onPressed: () => onClick(),
          )
        : OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(width ?? 300, height ?? 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 28),
              ),
              side: BorderSide(
                  color: buttonColor ?? appColors.background, width: 1),
            ),
            child: NormalText(
                   text ?? 'Continue',
                    color: textColor ?? appColors.white,
                    weight: FontWeight.bold,
                    size: textSize ?? 15,
                  )
                ,
            onPressed: () => !isLoading ? onClick() : () {},
        );
  }
}
