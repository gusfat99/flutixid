part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;
  final EdgeInsets margin;
  const PromoCard({super.key,required this.promo, this.margin = EdgeInsets.zero });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          margin: margin,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: mainColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    promo.title,
                    style: whiteTextFont.copyWith(fontSize: 14),
                  ),
                  Text(
                    promo.subtitle,
                    style: whiteTextFont.copyWith(fontSize: 11, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'OFF ',
                    style: yellowTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '${promo.discount}%',
                    style: yellowNumberFont.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
        ShaderMask(
          shaderCallback: (_) {
            return LinearGradient(
                    colors: [Colors.red.withOpacity(0.1), Colors.transparent],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft)
                .createShader(const Rect.fromLTRB(0, 0, 94, 80));
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            height: 80,
            width: 94,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0)),
              child: Image.asset('assets/reflection2.png'),
            ),
          ),
        ),
        Shimmer(
            period: const Duration(seconds: 4),
            gradient: LinearGradient(
              begin: const Alignment(-0.1, 1),
              end: const Alignment(0.5, -1),
              stops: const [0.4, 0.5, 0.6],
              colors: [
                Colors.white.withOpacity(0),
                Colors.white.withOpacity(0.3),
                Colors.white.withOpacity(0),
              ],
            ),
            child: Container(
              height: 80,
              decoration:  BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            )),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.transparent
                  ]).createShader(const Rect.fromLTRB(0, 0, 96, 45));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 45,
              width: 96,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset("assets/reflection1.png")),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.transparent
                  ]).createShader(const Rect.fromLTRB(0, 0, 53, 25));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 25,
              width: 53,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset("assets/reflection1.png")),
            ),
          ),
        )
      ],
    );
  }
}
