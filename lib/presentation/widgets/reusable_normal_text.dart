import 'package:cartoon_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReusableNormalText extends StatefulWidget {
  ReusableNormalText({
    super.key,
    required this.text,
    this.maxLines = 2,
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.fontSize = 18.00,
    this.fontWeight = FontWeight.w600,
    this.color = AppColor.myBaseColor1,
  });

  String text;
  int maxLines;
  TextOverflow textOverflow;
  TextAlign textAlign;
  double fontSize;
  FontWeight fontWeight;
  Color color;

  @override
  State<ReusableNormalText> createState() => _ReusableNormalTextState();
}

class _ReusableNormalTextState extends State<ReusableNormalText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      maxLines: widget.maxLines,
      style: TextStyle(
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        color: widget.color,
      ),
    );
  }
}
