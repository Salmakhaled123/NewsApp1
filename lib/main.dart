import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/cubitMode/cubitdark_light.dart';
import 'package:newsapp/modules/buissness/buissnessScreen.dart';
import 'package:newsapp/network/local/cache_helper.dart';
import 'package:newsapp/network/remote/dio_helper.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'bloc_observer.dart';
import 'cubitMode/states.dart';
import 'layout/homePage.dart';
void main()async

{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  diohelper.init();
 await CacheHelper.init();
 bool? isdark=CacheHelper.getdata(key: 'isDark');
  runApp(NewsApp(isdark));
}
class NewsApp extends StatelessWidget
{
  bool? isdark;
   NewsApp(this.isdark) ;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
          BlocProvider(create: (context)=>NewsCubit()..getBuissness()..getSports()..getScience()),
       BlocProvider(create: (context)=>NewsThemeMode()..ChangeMode(fromShared:isdark )) ],
        child: BlocConsumer<NewsThemeMode,NewsThemestatesMode>(
          listener: (context,state){},
          builder: (context,state)=>MaterialApp(
              theme: ThemeData
                (primarySwatch: Colors.teal,
                  scaffoldBackgroundColor: Colors.white,

                  textTheme: TextTheme(bodyText1: TextStyle(fontSize: 20.0,
                      fontWeight: FontWeight.w600, color: Colors.black
                  )),
                  appBarTheme: AppBarTheme(
                      iconTheme: IconThemeData(color: Colors.black),
                      backgroundColor: Colors.white,
                      titleTextStyle: TextStyle(color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          statusBarIconBrightness: Brightness.dark),
                      elevation: 0.0),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      elevation: 20.0,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.teal
                  ),
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.teal)),
              darkTheme: ThemeData(primarySwatch: Colors.teal,
                inputDecorationTheme: InputDecorationTheme(
                   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),


                    iconColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.white,
                )),
                scaffoldBackgroundColor: HexColor('333739'),
                textTheme: TextTheme(bodyText1: TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.w600, color: Colors.white,)),
                appBarTheme: AppBarTheme(titleSpacing: 20.0,
                    backgroundColor: HexColor('333739'),
                    iconTheme: IconThemeData(color: Colors.white),
                    titleTextStyle: TextStyle(color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light),
                    elevation: 0.0),
                backgroundColor: HexColor('333739'),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: HexColor('333739'),
                    elevation: 20.0,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.teal,
                    unselectedItemColor: Colors.grey
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.teal),),

              debugShowCheckedModeBanner: false,

              themeMode: NewsThemeMode.get(context).isDark? ThemeMode.dark :ThemeMode.light,
              home: Scaffold(body: NewsLayout())

          )));
  }
}