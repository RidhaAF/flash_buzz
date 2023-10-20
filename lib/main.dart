import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flash_buzz/app/presentation/bloc/page/page_bloc.dart';
import 'package:flash_buzz/app/presentation/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:flash_buzz/app/routes/app_pages.dart';
import 'package:flash_buzz/app/utils/themes/app_theme.dart';
import 'package:flash_buzz/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  MyApp({super.key, this.savedThemeMode});

  final PageBloc pageBloc = di<PageBloc>();
  final TopHeadlinesBloc topHeadlinesBloc = di<TopHeadlinesBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => pageBloc),
        BlocProvider(create: (context) => topHeadlinesBloc),
      ],
      child: AdaptiveTheme(
        light: AppTheme.light,
        dark: AppTheme.dark,
        initial: savedThemeMode ?? AdaptiveThemeMode.system,
        builder: (lightTheme, darkTheme) => MaterialApp.router(
          title: 'Flash Buzz',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          routerConfig: AppPages.pages,
        ),
      ),
    );
  }
}
