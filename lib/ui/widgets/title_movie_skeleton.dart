part of 'widgets.dart';

class TitleMovieSkeleton extends StatelessWidget {
  final String? mainAxisAlignment;
  const TitleMovieSkeleton({super.key, this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          mainAxisAlignment != null && mainAxisAlignment == 'start'
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
      children: const [
        ShimmerContainer(
          height: 21,
          width: 190,
        ),
        SizedBox(
          height: 6.0,
        ),
        ShimmerContainer(
          height: 14,
          width: 90,
        ),
        SizedBox(
          height: 6.0,
        ),
        ShimmerContainer(
          height: 20,
          width: 128,
        ),
      ],
    );
  }
}
