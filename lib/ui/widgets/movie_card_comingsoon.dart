part of 'widgets.dart';

class MovieCardComingSoon extends StatelessWidget {
  final bool isLoading;
  final Movie? movie;
  final VoidCallback? onTap;
  final EdgeInsets margin;
  const MovieCardComingSoon(
      {super.key,
      this.movie,
      this.isLoading = true,
      this.onTap,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        width: 100,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: mainLightColor,
        ),
        child: isLoading
            ? ShimmerContainer(
                height: 140,
                width: 140,
                borderRadius: BorderRadius.circular(8.0),
              )
            : Container(
                width: 100,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          '$baseUrlImage/w780/${movie?.posterPath}'),
                      fit: BoxFit.cover),
                ),
              ),
      ),
    );
  }
}
