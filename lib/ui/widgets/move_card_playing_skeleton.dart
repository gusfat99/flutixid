part of 'widgets.dart';

class MovieCardPlayingSkeleton extends StatelessWidget {
  final EdgeInsets margin;
  const MovieCardPlayingSkeleton({super.key, this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 210,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),

      ),
      child: Stack(
        children: [
          Container(
            height: 140,
            width: 210,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child:  ShimmerContainer(height: 120, width: 210, baseColor: greyColor, borderRadius: BorderRadius.circular(8.0),),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ShimmerContainer(height: 16, width: 120,),
                SizedBox(height: 2.0,),
                ShimmerContainer(height: 20, width: 124,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
