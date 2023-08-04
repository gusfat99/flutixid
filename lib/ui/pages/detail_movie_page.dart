part of 'pages.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({super.key});

  // List<Credit> credits;

  @override
  Widget build(BuildContext context) {
    MovieDetail? movieDetail;
    List<Credit>? credits = [];

    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    int movieId = arguments['id'];

    // return Container(
    //   child: FutureBuilder(
    //       future: MovieService.getCreditMovie(movieId: movieId),
    //       builder: (_, snapshot) {
    //         // if(snapshot.connectionState == ConnectionState.done)
    //         if (snapshot.hasData) {
    //           print("snapshot data ${snapshot.data}");
    //           print("movieId ${movieId.toString()}");
    //         }
    //         return Column();
    //       }),
    // );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: accentColor,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          FutureBuilder(
            future: MovieService.getDetailMovie(movieId: movieId),
            builder: (_, snapshot) {
              bool hasLoadedDetail =
                  snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData;
              if (snapshot.hasData) {
                movieDetail = snapshot.data;
              }

              return ListView(
                children: [
                  Stack(
                    children: [
                      hasLoadedDetail
                          ? Stack(
                              children: [
                                //backdrop
                                Container(
                                    width: double.maxFinite,
                                    height: 270,
                                    decoration: BoxDecoration(
                                        color: greyColor,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '$baseUrlImage/w1280/${movieDetail?.backdropPath ?? movieDetail?.posterPath}'),
                                            fit: BoxFit.cover))),
                                //Gradient
                                Container(
                                  width: double.maxFinite,
                                  height: 271,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        Colors.white,
                                        Colors.white.withOpacity(0.0),
                                      ],
                                          begin: Alignment(0, 1),
                                          end: Alignment(0, 0.1))),
                                ),
                                //Icon Back button
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 24, top: 16),
                                  decoration: const BoxDecoration(
                                    color: mainColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const ShimmerContainer(
                              height: 270,
                              width: double.maxFinite,
                            ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: hasLoadedDetail
                        ? TitleMovie(
                            title: movieDetail!.title,
                            genreAndLanguage: movieDetail!.genresAndLanguage,
                            rate: movieDetail!.voteAverage,
                          )
                        : const TitleMovieSkeleton(),
                  ),
                  //Credits Section
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: defaultMargin),
                    child: FutureBuilder(
                        future: MovieService.getCreditMovie(movieId: movieId),
                        builder: (_, snapshot2) {
                          bool hasLoadedCredits = snapshot2.connectionState ==
                                  ConnectionState.done &&
                              snapshot2.hasData;
                          if (snapshot2.hasData) {
                            credits = snapshot2.data;
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: titleSection('Cast & Crew'),
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Container(
                                height: 116,
                                child: hasLoadedCredits
                                    ? ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: credits!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return CastCard(
                                            profilePath:
                                                credits![index].profilePath ??
                                                    null,
                                            name: credits![index].name,
                                            margin: EdgeInsets.only(
                                                right: index ==
                                                        (credits!.length - 1)
                                                    ? 0
                                                    : 13.0),
                                          );
                                        },
                                      )
                                    : ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return CastCardSkeleton(
                                            margin: EdgeInsets.only(
                                                right: index == 4 ? 0 : 13.0),
                                          );
                                        },
                                      ),
                              ),
                            ],
                          );
                        }),
                  ),
                  //Storyline Section
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleSection('Storyline'),
                        const SizedBox(
                          height: 8.0,
                        ),
                        hasLoadedDetail
                            ? Text(
                                movieDetail!.overview,
                                style: greyTextFont.copyWith(
                                  fontSize: 14,
                                ),
                              )
                            : const Column(
                                children: [
                                  ShimmerContainer(height: 60.0),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  ShimmerContainer(height: 60.0),
                                ],
                              ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 40.0),
                    height: 46.0,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: mainColor),
                      onPressed: () {},
                      child: Text(
                        "Continue to Book",
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget titleSection(title) {
    return Text(
      title,
      style: blackTextFont.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}
