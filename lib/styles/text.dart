import 'package:flutter/widgets.dart';
import 'package:mcuapp/styles/colors.dart';

class Header1 extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color color;
  final TextAlign textAlign;

  const Header1(this.text,
      {Key? key,
      this.fontSize = 22,
      this.fontWeight = FontWeight.bold,
      this.color = AppColors.primaryText,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
    child: Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
    )); 
  }
}
