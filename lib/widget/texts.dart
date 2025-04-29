
import 'package:flutter/material.dart';
import 'package:sippy/utils/colors.dart';

class NormalText extends StatelessWidget {
  final String? text;
  final FontWeight? weight;
  final double size;
  final double? height;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;

  const NormalText(this.text,
      {Key? key,
      this.weight,
      this.size = 14,
      this.color,
      this.textAlign,
      this.maxLines,
      this.decoration,
      this.fontStyle,
      this.height = 20,
      this.softWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '-',
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style:TextStyle(
        fontWeight: weight ?? FontWeight.w400,
        fontSize: size,
fontStyle:  fontStyle ?? FontStyle.normal,  
      color: color ?? appColors.black,
        height: height?.toFigmaHeight(size),
        decoration: decoration,
      ),
    );
  }
}


class JikooNaira extends StatelessWidget {
  final String? text;
  final FontWeight? weight;
  final double size;
  final double? height;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;

  const JikooNaira(this.text,
      {Key? key,
      this.weight,
      this.size = 14,
      this.color,
      this.textAlign,
      this.maxLines,
      this.decoration,
      this.fontStyle,
      this.height = 20,
      this.softWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '-',
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontWeight: weight ?? FontWeight.w400,
        fontSize: size,
        fontFamily: 'Helvetical',
fontStyle:  fontStyle ?? FontStyle.normal,  
      color: color ?? appColors.black,
        height: height?.toFigmaHeight(size),
        decoration: decoration,
      ),
    );
  }
}



extension FigmaDimention on double {
  double toFigmaHeight(double fontSize) {
    return this / fontSize;
  }
}