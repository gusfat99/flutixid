part of 'widgets.dart';

class HeaderNewMovieSkeleton extends StatelessWidget {
  const HeaderNewMovieSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 30),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.only(right: 16.0),
            child: const ShimmerContainer(height: 60.0, width: 60.0, variant: 'circle',),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerContainer(height: 21.0, width: 104),
              SizedBox(height: 4.0,),
              ShimmerContainer(height: 19.0, width: 80),
            ],
          )
        ],
      ),
    );
  }
}
