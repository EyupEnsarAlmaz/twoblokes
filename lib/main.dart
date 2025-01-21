import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:twoblokes/feature/home/home_page.dart';
import 'package:twoblokes/feature/signin/signin_page.dart';
import 'package:twoblokes/feature/topic/topic_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twoblokes/product/bloc/auth/auth_bloc.dart';
import 'package:twoblokes/product/bloc/auth/auth_event.dart';
import 'package:twoblokes/product/bloc/auth/auth_state.dart';
import 'package:twoblokes/product/bloc/login/login_bloc.dart';
import 'package:twoblokes/product/bloc/news/news_bloc.dart';
import 'package:twoblokes/product/bloc/news/news_event.dart';
import 'package:twoblokes/product/bloc/register/register_bloc.dart';
import 'package:twoblokes/product/services/auth_service.dart';
import 'package:twoblokes/services/news_service.dart';
import 'feature/signup/signup_page.dart';

void main() {
  final authService = AuthService('http://localhost:8089');
  final newsService = NewsService();
  runApp(
    MultiBlocProvider(
      providers: [
         BlocProvider(
          create: (context) => NewsBloc(newsService)..add(FetchNews()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(authService)..add(CheckAuthStatus()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(authService),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(authService),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/twoblokes.png"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return HomePage();
              } else if (state is Unauthenticated) {
                return HomePage();
              }
              return const HomePage();
            },
          ),
        ));
  }
}
