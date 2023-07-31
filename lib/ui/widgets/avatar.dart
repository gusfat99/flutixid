part of 'widgets.dart';

class Avatar extends StatelessWidget {
  const Avatar(
      {super.key,
      required this.height,
      required this.width,
      this.imageFile,
      this.imageUrl});

  final double width;
  final double height;
  final File? imageFile;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: imageFile == null && imageUrl == null
                  ? const AssetImage('assets/user_pic.png')
                  : (imageFile != null
                      ? FileImage(imageFile!) as ImageProvider
                      : NetworkImage(imageUrl!)),
              fit: BoxFit.cover)),
    );
  }
}
