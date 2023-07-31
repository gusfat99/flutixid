part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  const BrowseButton({super.key, required this.genre});
  final String genre;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: SizedBox(
        height: 68,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(7.0),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: mainLightColor,
              ),
              child: Image.asset(getImageFromGenre(genre)),
            ),
            Text(genre, style: const TextStyle(
                fontSize: 12
            ),)
          ],
        ),
        // child: Image.asset(''),
      ),
   );
  }

  String getImageFromGenre(String genre) {
    switch (genre) {
      case "Horror":
        return "assets/ic_horror.png";
        break;
      case "Music":
        return "assets/ic_music.png";
        break;
      case "Action":
        return "assets/ic_action.png";
        break;
      case "Drama":
        return "assets/ic_drama.png";
        break;
      case "War":
        return "assets/ic_war.png";
        break;
      case "Crime":
        return "assets/ic_crime.png";
        break;
      case "Super Hero":
        return "assets/ic_crime.png";
        break;
      default:
        return "assets/ic_crime.png";
    }
  }
}
