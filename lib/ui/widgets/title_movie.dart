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
      crossAxisAlignment:
          mainAxisAlignment != null && mainAxisAlignment == 'start'
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
      mainAxisAlignment:
          mainAxisAlignment != null && mainAxisAlignment == 'start'
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin) - 90,
          child: Text(
            title,
            style: blackTextFont.copyWith(
                fontSize:
                    mainAxisAlignment != null && mainAxisAlignment == 'start'
                        ? 16
                        : 20,
                fontWeight: FontWeight.w600),
            maxLines: 3,
            overflow: TextOverflow.clip,
            textAlign: mainAxisAlignment != null && mainAxisAlignment == 'start'
                ? TextAlign.left
                : TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Container(
          width: mainAxisAlignment == 'start'
              ? MediaQuery.of(context).size.width - (2 * defaultMargin) - 90
              : double.infinity,
          child: Text(
            genreAndLanguage,
            style: greyTextFont.copyWith(
              fontSize: 12,
              overflow: TextOverflow.clip,
            ),
            maxLines: 3,
            textAlign: mainAxisAlignment == 'start'
                ? TextAlign.left
                : TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        RatingStarts(
          averageRate: rate,
          textStyle: greyNumberFont.copyWith(
              fontSize: 12, fontWeight: FontWeight.w300),
          mainAxisAlignment:
              mainAxisAlignment != null && mainAxisAlignment == 'start'
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
        ),
      ],
    );
  }
}
