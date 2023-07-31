// ignore_for_file: non_constant_identifier_names

part of 'shared.dart';

Future getImage() async {
  ImagePicker picker = ImagePicker();
  var image = await picker.pickImage(source: ImageSource.gallery);
  return File(image!.path);
}

void FlushBarShow(BuildContext context, int duration, String message) {
  Flushbar(
    duration: Duration(milliseconds: duration),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: dangerColor,
    messageText: Text(
      message,
      textAlign: TextAlign.center,
      style: whiteTextFont.copyWith(
        fontSize: 12.0,
      ),
    ),
  ).show(context);
}

Map<String, String> get headers => {
  "Content-Type": "application/json",
  "Accept": "application/json",
  "Authorization": "Bearer $apiToken",
};
