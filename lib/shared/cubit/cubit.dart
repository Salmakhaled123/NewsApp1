import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/buissness/buissnessScreen.dart';
import 'package:newsapp/modules/science/scienceScreen.dart';
import 'package:newsapp/modules/settingsScreen/SettingsScreen.dart';
import 'package:newsapp/modules/sports/sportsScreen.dart';
import 'package:newsapp/network/remote/dio_helper.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:dio/dio.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget>Screens=
  [
    BuissnessScreen(),
    SportsScreen(),
    ScienceScreen(),


  ];
  List<BottomNavigationBarItem> bottomNavItems=
  [
   BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: 'Buissness'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),


  ];
   change(int index) {
     // if (index == 1) {
     //   getSports();
     // }
     // else{
     //   getScience();
     // }
    currentIndex=index;
    emit(NewsBottomNavbarState());
  }
  List<dynamic>buisness=[];
   void getBuissness()
   {
         emit(NewsBuisnessLoadingState());
         diohelper.getData(url: 'v2/top-headlines', query:{
           'country':'eg',
           'category':'business',
           'apikey':'10fcd807e49447848e41b598cb3afc17'
         }).then((value)
         {
           print('request get successfully');

           buisness=value.data['articles'];

           emit(NewsGetScienceDataSuccessState());

         }).catchError((error)
         {
           print(error.toString());
           emit(NewsGetDataErrorState(error.toString()));
         });
   }

  List<dynamic>Sports=[];
  void getSports()
  {
    if(Sports.length==0)
      {
        emit(NewsSportsLoadingState());
        diohelper.getData(url: 'v2/top-headlines', query:{
          'country':'eg',
          'category':'sports',
          'apikey':'10fcd807e49447848e41b598cb3afc17'
        }).then((value)
        {
          print('request get successfully');

          Sports=value.data['articles'];

          emit(NewsGetSportsDataSuccessState());

        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetDataSportsErrorState(error.toString()));
        });
      }
    else
      {
        emit(NewsGetSportsDataSuccessState());
      }

  }


  List<dynamic>science=[];
  void getScience()
  {
    if(science.isEmpty)
      {
        emit(NewsScienceLoadingState());
        diohelper.getData(url: 'v2/top-headlines', query:{
          'country':'eg',
          'category':'Science',
          'apikey':'10fcd807e49447848e41b598cb3afc17'
        }).then((value)
        {
          print('request get successfully');

          science=value.data['articles'];

          emit(NewsGetScienceDataSuccessState());

        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetDataScienceErrorState(error.toString()));
        });
      }
    else
      {
        emit(NewsGetScienceDataSuccessState());
      }
  }
  List <dynamic>search=[];
  void getSearch(String value)
  {
    emit(NewsSearchLoadingState());

      emit(NewsSearchLoadingState());
      diohelper.getData(url:'v2/everything', query:{

        'q':'$value',
        'apikey':'10fcd807e49447848e41b598cb3afc17'
      }).then((value)
      {
        search=value.data['articles'];
        print(search[0]['title'].toString());
        print('request get successfully');


        emit(NewsGetSearchDataSuccessState());

      }).catchError((error)
      {
       print('error here !');
        emit(NewsGetDataSearchErrorState(error.toString()));
      });
    }





}
