part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final double height;
  final double width;
  final bool isSelected;
  final String label;
  final VoidCallback? onTap;
  final Color activeColor;

  const SelectableBox(
      {super.key,
      required this.height,
      required this.width,
      required this.isSelected,
      required this.label,
      this.activeColor = yellowColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? activeColor : greyColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(6.0),
            color: isSelected ? activeColor : Colors.white),
        child: Center(
          child: Text(
            label,
            style: blackTextFont.copyWith(
                fontSize: 16.0, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
