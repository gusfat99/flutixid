part of 'widgets.dart';

class CastCardSkeleton extends StatelessWidget {
  final EdgeInsets margin;

  const CastCardSkeleton({super.key, this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      width: 70,
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShimmerContainer(
            height: 80.0,
            width: 70.0,
            borderRadius: BorderRadius.circular(8.0),
          ),
          const ShimmerContainer(height: 24.0)
        ],
      ),
    );
  }
}
