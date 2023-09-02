part of 'widgets.dart';

class ItemDescription extends StatelessWidget {
  final String label;
  // ignore: prefer_typing_uninitialized_variables
  final value;
  final bool isNumeric;
  final TextStyle? textValueStyle;
  const ItemDescription(
      {super.key,
      required this.label,
      required this.value,
      this.isNumeric = false,
      this.textValueStyle});

  @override
  Widget build(BuildContext context) {
    TextStyle? textValue = blackTextFont;
    if (isNumeric) {
      textValue = blackNumberFont;
    }
    if (textValueStyle != null) {
      textValue = textValueStyle;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: greyTextFont.copyWith(fontSize: 16),
        ),
        const SizedBox(width: 8.0),
        SizedBox(
          width: 170.0,
          child: Text(
            '$value',
            textAlign: TextAlign.right,
            style: textValue!.copyWith(fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
