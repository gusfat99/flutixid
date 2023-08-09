part of 'shared.dart';

const double defaultMargin = 24;

const Color mainColor = Color(0xFF503E9D);
const Color mainLightColor = Color(0xFFEBEFF6);
const Color accentColor = Color(0xFF2C1F63);
const Color yellowColor = Color(0xFFFBD460);
const Color greyColor = Color(0xFFADADAD);
const Color grey2Color = Color(0xFFBEBEBE);
const Color whiteColor = Color(0xFFFFFFFF);
const Color dangerColor = Color(0xFFFF5C83);
const Color successColor = Color(0xFF3E9D9D);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle mainTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: greyColor, fontWeight: FontWeight.w500);
TextStyle yellowTextFont = GoogleFonts.raleway()
    .copyWith(color: yellowColor, fontWeight: FontWeight.w500);
TextStyle dangerTextFont = GoogleFonts.raleway()
    .copyWith(color: dangerColor, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle blackNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.black);
TextStyle greyNumberFont = GoogleFonts.openSans().copyWith(color: greyColor);
TextStyle yellowNumberFont =
    GoogleFonts.openSans().copyWith(color: yellowColor);
