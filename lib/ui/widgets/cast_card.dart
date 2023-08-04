part of 'widgets.dart';

class CastCard extends StatelessWidget {
  final EdgeInsets margin;
  final String? profilePath;
  final String name;
  const CastCard(
      {super.key,
      this.profilePath,
      required this.name,
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      width: 70,
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 70,
            height: 80,
            decoration: BoxDecoration(
                color: profilePath != null ? greyColor : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: profilePath != null
                        ? NetworkImage('$baseUrlImage/w185/$profilePath')
                        : const AssetImage('assets/user_pic.png')
                            as ImageProvider,
                    fit: profilePath != null ? BoxFit.cover : BoxFit.contain)),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: blackTextFont.copyWith(fontSize: 10),
          )
        ],
      ),
    );
  }
}
