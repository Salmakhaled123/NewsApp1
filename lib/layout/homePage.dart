import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubitMode/cubitdark_light.dart';
import 'package:newsapp/network/remote/dio_helper.dart';
import 'package:newsapp/search/searchScreen.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget
{
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context,state)
      {
        var cubit=NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(actions:
          [
            IconButton(onPressed: ()
            {
                 NavigateTo(context, searchScreen());
            }, icon: Icon(Icons.search)),
            IconButton(onPressed: ()
            {
              NewsThemeMode.get(context).ChangeMode();

            }, icon:Icon(Icons.brightness_2) )
          ],
            title: Text('News App',),
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(items: cubit.bottomNavItems,
              onTap: (index)
              {
              cubit.change(index);

              },
              currentIndex:cubit.currentIndex ,
              ),);
      },
      listener: (context,state){}
    );
  }
}
