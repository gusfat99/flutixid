part of 'pages.dart';

class NewMoviesPage extends StatelessWidget {
  const NewMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ThemeBloc>().add(ChangeTheme(
        themeData: ThemeData(fontFamily: GoogleFonts.raleway().fontFamily)));

    return ListView(
      children: [
        BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            if ((userState is UserLoaded)) {
              return Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 24, right: 24, bottom: 30),
                decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      padding: const EdgeInsets.all(5.0),
                      margin: const EdgeInsets.only(right: 16.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF5F558B),
                            width: 1.0,
                          )),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: userState?.user?.profilePicture == ""
                                    ? const AssetImage("assets/user_pic.png")
                                        as ImageProvider
                                    : NetworkImage(
                                        userState!.user.profilePicture),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userState.user.name,
                          style: whiteTextFont.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          Utilities.toCurrency(
                              userState.user.balance, 0, 'IDR '),
                          style: yellowNumberFont.copyWith(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            return const HeaderNewMovieSkeleton();
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 30.0, bottom: 88.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Move On Playing Section
              Container(
                margin:
                    const EdgeInsets.only(left: defaultMargin, bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleSection('Now Playing'),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 140,
                      child: BlocBuilder<MovieBloc, MovieState>(
                        builder: (context, movieState) {
                          if (movieState is MovieOnPlayingLoaded) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: movieState.movies.length,
                                itemBuilder: (_, index) {
                                  return MovieCardPlaying(
                                    margin: const EdgeInsets.only(right: 16.0),
                                    movie: movieState.movies[index],
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/movie-detail', arguments: {
                                        'id': movieState.movies[index].id
                                      });
                                    },
                                  );
                                });
                          } else {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (_, index) {
                                  return const MovieCardPlayingSkeleton(
                                    margin: EdgeInsets.only(right: 16.0),
                                  );
                                });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //Browse Movie Section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleSection('Browse Movie'),
                    const SizedBox(
                      height: 12,
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, userState) {
                        if (userState is UserLoaded) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                userState.user.selectedGenres.length,
                                (index) => BrowseButton(
                                      genre:
                                          userState.user.selectedGenres[index],
                                    )),
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                4, (index) => const BrowseButtonSkeleton()),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              //Coming soon Section
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: defaultMargin, bottom: 12.0),
                      child: titleSection('Coming Soon'),
                    ),
                    SizedBox(
                      height: 140,
                      child: BlocBuilder<MovieComingBloc, MovieComingState>(
                        builder: (context, movieState) {
                          bool isLoaded = movieState is MovieComingSoonLoaded;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  isLoaded ? movieState.movies.length : 5,
                              itemBuilder: (_, index) => MovieCardComingSoon(
                                    movie: (isLoaded
                                        ? movieState.movies[index]
                                        : null),
                                    isLoading: !isLoaded,
                                  ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //Discount Section
              Container(
                margin: const EdgeInsets.all(defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleSection('Get Lucky Day'),
                    const SizedBox(
                      height: 13.0,
                    ),
                    ...dummyPromos.map((el) {
                      int idx = dummyPromos.indexOf(el);
                      return PromoCard(
                          promo: el,
                          margin: EdgeInsets.only(
                              bottom:
                                  idx == dummyPromos.length - 1 ? 0 : 16.0));
                    }).toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget titleSection(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
