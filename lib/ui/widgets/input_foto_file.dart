part of 'widgets.dart';

class InputFotoFile extends StatelessWidget {
  final EdgeInsets margin;
  final VoidCallback onChanged;
  final File? imageTemporary;

  const InputFotoFile({super.key, this.margin = EdgeInsets.zero, required this.onChanged, this.imageTemporary});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 102,
      width: 90,
      margin: margin,
      child: Stack(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: imageTemporary == null ? const AssetImage('assets/user_pic.png') : FileImage(imageTemporary!) as ImageProvider ,
                    fit: BoxFit.cover)
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: onChanged,
                child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image:  DecorationImage(image: AssetImage(imageTemporary == null ? "assets/btn_add_photo.png" : "assets/btn_del_photo.png")),
                    )),
              )),
        ],
      ),
    );
  }
}
