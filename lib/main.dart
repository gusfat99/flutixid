import 'package:flutix/bloc/blocs.dart';
import 'package:flutix/bloc/movie_bloc.dart';
import 'package:flutix/bloc/ticket_bloc.dart';
import 'package:flutix/services/services.dart';
import 'package:flutix/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutix/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PageBloc>(create: (BuildContext context) => PageBloc()),
          BlocProvider<UserBloc>(create: (BuildContext context) => UserBloc()),
          BlocProvider<ThemeBloc>(
              create: (BuildContext context) => ThemeBloc()),
          BlocProvider<MovieBloc>(
            create: (BuildContext context) => MovieBloc(),
          ),
          BlocProvider<MovieComingBloc>(
            create: (BuildContext context) => MovieComingBloc(),
          ),
          BlocProvider<OrderStepBloc>(
              create: (BuildContext context) => OrderStepBloc()),
          BlocProvider<TicketBloc>(
              create: (BuildContext context) => TicketBloc())
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            context.read<MovieBloc>().add(FetchMoviesOnPlaying());
            context.read<MovieComingBloc>().add(FetchMoviesComingSoon());

            return MaterialApp(
              theme: themeState.themeData,
              debugShowCheckedModeBanner: false,
              routes: {
                '/': (context) => const Scaffold(
                      body: Wrapper(),
                    ),
                '/movie-detail': (context) => const DetailMoviePage(),
                '/ordering': (context) => const Scaffold(
                      body: WrapperOrder(),
                    ),
                '/topup': (context) => const TopupPage(),
                '/successfull': (context) => const SuccessfullPage(),
                '/ticket-details': (context) => const TicketDetailsPage()
              },
            );
          },
        ),
      ),
    );
  }
}
