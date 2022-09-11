import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/states.dart';
import '../shared/cubit/cubit.dart';

class searchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  bool isSearch = false;
  searchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
            appBar: AppBar(),
            body: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    onchanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'search musn\' t be empty';
                      } else {
                        isSearch = true;
                      }
                    },
                    prefix: Icons.search,
                    label: 'Search'),
              ),
              Expanded(child: ArticleBuilder(list, context,isSearch: true))
            ]));
      },
      listener: (context, state) {},
    );
  }
}
