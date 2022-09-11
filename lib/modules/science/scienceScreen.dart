import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget
{
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    var science=NewsCubit.get(context).science;
    return ArticleBuilder(science,context);
  }
}
