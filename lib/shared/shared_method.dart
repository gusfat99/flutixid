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

List<String> getTimeSlots({int start = 0, int end = 24, int hourDiff = 2}) {
  List<String> slots = [];

  int i = start;
  while (i <= 24) {
    if (i < 10) {
      slots.add('0$i:00 AM');
    } else if (i < 12) {
      slots.add('$i:00 AM');
    } else if (i == 12) {
      slots.add('$i:00 PM');
    } else if (i == 24) {
      //do nothing already added 12:00AM or 00:00AM
    } else {
      slots.add('${i % 12}:00 PM');
    }

    i = i + hourDiff;
  }

  return slots;
}

Map<String, String> get headers => {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $apiToken",
    };
