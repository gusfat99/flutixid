part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  const MainPage({super.key, this.bottomNavBarIndex = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int currentIndexBottomNavBar;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    currentIndexBottomNavBar = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: widget.bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    context.read<ThemeBloc>().add(ChangeTheme(
            themeData: ThemeData(
          fontFamily: GoogleFonts.raleway().fontFamily,
        )));

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: accentColor,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
              child: PageView(
                controller: pageController,
                children: const [NewMoviesPage(), TicketsPage()],
                onPageChanged: (index) {
                  setState(() {
                    currentIndexBottomNavBar = index;
                  });
                },
              ),
            ),
          ),
          customBottomNavBar(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(bottom: 42.0),
                  height: 46.0,
                  width: 46.0,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: yellowColor,
                    onPressed: () async {
                      Navigator.pushNamed(context, "/topup", arguments: {});
                      // await AuthServices.signOut();
                    },
                    child: Image.asset(
                      'assets/top_up.png',
                      width: 26.0,
                    ),
                  )))
        ],
      ),
    );
  }

  Widget customBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 65.0,
            decoration: BoxDecoration(
              color: mainLightColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.black,
              unselectedItemColor: greyColor,
              currentIndex: currentIndexBottomNavBar,
              selectedLabelStyle: const TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.w600,
              ),
              onTap: (index) {
                setState(() {
                  currentIndexBottomNavBar = index;
                  pageController.jumpToPage(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                  label: "New Movies",
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 6.0),
                      child: Image.asset(
                        currentIndexBottomNavBar == 0
                            ? 'assets/ic_movie.png'
                            : 'assets/ic_movie_grey.png',
                        width: 24.0,
                      )),
                ),
                BottomNavigationBarItem(
                  label: "My Tickets",
                  icon: Container(
                      margin: const EdgeInsets.only(bottom: 6.0),
                      child: Image.asset(
                        currentIndexBottomNavBar == 1
                            ? 'assets/ic_tickets.png'
                            : 'assets/ic_tickets_grey.png',
                        width: 24.0,
                      )),
                ),
              ],
            ),
          ),
        ),
      );
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo((size.width / 2) - 30, 0);
    path.quadraticBezierTo((size.width / 2) - 30, 30, size.width / 2, 30);
    path.quadraticBezierTo(size.width / 2 + 30, 30, size.width / 2 + 30, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
