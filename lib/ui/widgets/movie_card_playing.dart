part of 'widgets.dart';

class MovieCardPlaying extends StatelessWidget {
  final EdgeInsets margin;
  final Movie movie;
  final VoidCallback? onTap;
  const MovieCardPlaying(
      {super.key,
      this.margin = EdgeInsets.zero,
      required this.movie,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        width: 210,
        margin: margin,
        decoration: BoxDecoration(
          color: mainLightColor,
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
              image: NetworkImage(
                  '$baseUrlImage/w780/${movie.backdropPath ?? movie.posterPath}'),
              fit: BoxFit.cover),
        ),
        child: Container(
          height: 140,
          width: 210,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.61),
                Colors.black.withOpacity(0)
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                movie.title,
                style: whiteTextFont.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 2.0,
              ),
              RatingStarts(
                averageRate: movie.voteAverage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
