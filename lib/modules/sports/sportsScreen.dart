import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/cubit.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/states.dart';

class SportsScreen extends StatelessWidget
{
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    var sports=NewsCubit.get(context).Sports;
    return ArticleBuilder(sports,context);
  }
}
