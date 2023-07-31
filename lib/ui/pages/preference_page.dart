part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final RegistrationData? registrationData;

  final List<String> genres = [
    "Horror",
    "Music",
    "Action",
    "Drama",
    "War",
    "Crime",
    "Super Hero",
    "Adventure"
  ];

  final List<Map> languages = [
    {"id": "id", "lng": 'Bahasa'},
    {"id": "en", "lng": 'English'},
    {"id": "jp", "lng": 'Japanese'},
    {"id": "kr", "lng": 'Korean'},
  ];

  PreferencePage({super.key, this.registrationData});
  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguage = "en";

  void handleChangeGenres(String value) {
    int isExistIndex = selectedGenres.indexOf(value);

    if (isExistIndex > -1) {
      setState(() {
        selectedGenres.remove(value);
      });
    } else {
      setState(() {
        selectedGenres.add(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void handleGoBack() {
      context
          .read<PageBloc>()
          .add(GoToRegistration(registrationData: widget.registrationData));
    }

    return WillPopScope(
      onWillPop: () {
        handleGoBack();
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              const SizedBox(
                height: 36.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    handleGoBack();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Select Your\nFavorite Genre',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, height: 1.5),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Wrap(
                spacing: 24.0,
                runSpacing: 24.0,
                children: generateGenreMovieWidgets(context),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                'Movie Language\nYour Prefer?',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, height: 1.5),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Wrap(
                spacing: 24.0,
                runSpacing: 24.0,
                children: generateLangMovieWidgets(context),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    if (selectedGenres.length < 4) {
                      FlushBarShow(
                          context, 1500, 'Please select min. 4 genres');
                    } else {
                      widget.registrationData?.selectedGenres = selectedGenres;
                      widget.registrationData?.selectedLang = selectedLanguage;

                      context.read<PageBloc>().add(GoToAccountConfirmPage(
                          registrationData: widget.registrationData));
                    }
                  },
                  elevation: 0,
                  backgroundColor: mainColor,
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 24,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> generateGenreMovieWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - (2 * defaultMargin) - 24) / 2;
    return widget.genres
        .map((genre) => (SelectableBox(
              height: 60,
              width: width,
              label: genre,
              isSelected: selectedGenres.contains(genre),
              onTap: () {
                handleChangeGenres(genre);
              },
            )))
        .toList();
  }

  List<Widget> generateLangMovieWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - (2 * defaultMargin) - 24) / 2;
    return widget.languages
        .map((lng) => (SelectableBox(
              height: 60,
              width: width,
              label: lng['lng'],
              isSelected: lng['id'] == selectedLanguage,
              onTap: () {
                setState(() {
                  selectedLanguage = lng['id'];
                });
              },
            )))
        .toList();
  }
}
