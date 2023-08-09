part of 'widgets.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  const SubmitButton(
      {super.key,
      this.onPressed,
      this.isLoading = false,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: isLoading
          ? Container(
              height: 50,
              width: 50,
              child: const SpinKitCircle(
                size: 24,
                color: mainColor,
              ),
            )
          : FloatingActionButton(
              elevation: 0,
              backgroundColor: isDisabled ? grey2Color : mainColor,
              onPressed: isDisabled ? null : onPressed,
              child: Icon(
                color: isDisabled ? greyColor : whiteColor,
                Icons.arrow_forward,
                size: 24,
              ),
            ),
    );
  }
}
