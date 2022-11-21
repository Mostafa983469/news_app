import 'package:News_App/shared/bloc_observer.dart';
import 'package:News_App/shared/network/local/sharred.dart';
import 'package:News_App/shared/network/remote/Dio.dart';
import 'package:News_App/shared/components/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/news/cubic/cubic.dart';
import 'layout/news/cubic/states.dart';
import 'layout/news/newsHome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await Sharred.init();
  bool isDark = Sharred.GetBool(key: 'isdark')??false;
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubic()
        ..GetNews()
        ..GetScience()
        ..GetSport()
        ..ChangeMode(isdark: isDark),
      child: BlocConsumer<NewsCubic, NewsStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: LightTheme,
            darkTheme: DarkTheme,
            themeMode: NewsCubic.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: NewsHome(),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
