part of 'widgets.dart';

class RatingStarts extends StatelessWidget {
  final double averageRate;
  final double iconSize;
  final double fontSize;
  final Color starColor;
  final TextStyle? textStyle;
  final MainAxisAlignment? mainAxisAlignment;

  const RatingStarts(
      {super.key,
      required this.averageRate,
      this.iconSize = 20.0,
      this.fontSize = 12.0,
      this.textStyle,
      this.mainAxisAlignment,
      this.starColor = yellowColor});

  @override
  Widget build(BuildContext context) {
    int n = (averageRate / 2).round();

    List<Widget> starsWidget = List.generate(
        5,
        (index) => Icon(
              Icons.star,
              size: iconSize,
              color: n > index ? starColor : grey2Color,
            ));
    starsWidget.add(const SizedBox(
      width: 3,
    ));
    starsWidget.add(Text(
      '${averageRate.round()}/10',
      style: textStyle ??
          whiteNumberFont.copyWith(
              fontSize: fontSize, fontWeight: FontWeight.w300),
    ));

    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: starsWidget.toList(),
    );
  }
}
