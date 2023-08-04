part of 'widgets.dart';

class TitleMovie extends StatelessWidget {
  final String title;
  final double rate;

  final String? mainAxisAlignment;
  final String genreAndLanguage;

  const TitleMovie(
      {super.key,
      required this.title,
      required this.genreAndLanguage,
      required this.rate,
      this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          mainAxisAlignment != null && mainAxisAlignment == 'start'
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: blackTextFont.copyWith(
              fontSize:
                  mainAxisAlignment != null && mainAxisAlignment == 'start'
                      ? 18
                      : 24,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          genreAndLanguage,
          style: greyTextFont.copyWith(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6.0,
        ),
        RatingStarts(
          averageRate: rate,
          textStyle: greyNumberFont.copyWith(
              fontSize: 12, fontWeight: FontWeight.w300),
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
}
