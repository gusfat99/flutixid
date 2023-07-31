part of 'widgets.dart';

class BrowseButtonSkeleton extends StatelessWidget {
  const BrowseButtonSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 68,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            child: ShimmerContainer(height: 50, width: 50, borderRadius:BorderRadius.circular(8.0) ,),
          ),
          const ShimmerContainer(height: 14, width: 50,)
        ],
      ),
      // child: Image.asset(''),
    );
  }
}
