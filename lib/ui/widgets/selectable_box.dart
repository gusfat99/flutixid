part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final double height;
  final double width;
  final bool isSelected;
  final String? label;
  final Widget? child;
  final VoidCallback? onTap;
  final Color activeColor;
  final EdgeInsets margin;
  final bool isDisabled;
  final bool isNumeric;

  const SelectableBox(
      {super.key,
      this.margin = EdgeInsets.zero,
      this.isDisabled = false,
      this.isNumeric = false,
      required this.height,
      required this.width,
      required this.isSelected,
      this.child,
      this.label,
      this.activeColor = yellowColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    var textFont = blackTextFont;
    if (isDisabled) {
      textFont = greyTextFont;
    }
    if (isNumeric) {
      textFont = blackNumberFont;
      if (isDisabled) {
        textFont = greyNumberFont;
      }
    }

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? activeColor
                  : (isDisabled ? const Color(0xFFF6F6F6) : greyColor),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(6.0),
            color: isSelected
                ? activeColor
                : (isDisabled ? const Color(0xFFF6F6F6) : Colors.white)),
        child: Center(
          child: child ??
              Text(label ?? '',
                  textAlign: TextAlign.center,
                  style: textFont.copyWith(
                      height: 1.7,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
