import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubitMode/states.dart';
import 'package:newsapp/network/local/cache_helper.dart';

class NewsThemeMode extends Cubit<NewsThemestatesMode>
{
  NewsThemeMode():super(NewsInitialModeState());
 static NewsThemeMode get(context)=>BlocProvider.of(context);
  bool isDark=true;
  void ChangeMode({  bool ?fromShared})
  {
    if(fromShared!=null)
      {
        isDark=fromShared;
        emit(NewsChangeMode());
      }
    else
      {
        isDark=!isDark;
        CacheHelper.putdata(key: 'isDark', value: isDark).then((value)
        {
          emit(NewsChangeMode());
        });
      }


  }
}