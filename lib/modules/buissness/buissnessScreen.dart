import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

import '../../shared/components/components.dart';

class BuissnessScreen extends StatelessWidget {
  const BuissnessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    var news=NewsCubit.get(context).buisness;
    return ArticleBuilder(news,context);
  }


  }




