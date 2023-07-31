part of 'widgets.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    this.focusedColor,
    this.hint,
    required this.label,
    this.obscureText = false,
    this.onChanged,
    this.controller,
    this.isPasswordType = false,
    this.onTapVisibility,
    this.helperText = null,
    this.hasFocused = false,
    this.focusNode = null,
    this.validator
  });

  final Color? focusedColor;
  final String? hint;
  final String label;
  final bool obscureText;
  final bool isPasswordType;
  final ValueChanged? onChanged;
  final TextEditingController? controller;
  final VoidCallback? onTapVisibility;
  final String? helperText;
  final bool hasFocused;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {},
      focusNode: focusNode,
      onChanged:onChanged,
      autofocus: true,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        helperText: helperText,
        helperStyle: dangerTextFont.copyWith(),
        labelText: label,
        hintText: hint,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1,color: dangerColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1,color: dangerColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // suffixIconColor: greyColor,
        suffixIcon: isPasswordType ? GestureDetector(
          onTap: onTapVisibility,
          child: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
              ),
            )
          ),
        ) : null,
      ),
    );
  }
}
