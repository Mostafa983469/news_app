import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/news/cubic/cubic.dart';
import '../../layout/news/cubic/states.dart';
import '../../shared/components/components.dart';
class business extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubic,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: NewsCubic.get(context).news.isNotEmpty ,
          builder: (context) =>  ListView.separated(
            itemBuilder: (context,index) => List(NewsCubic.get(context).news[index],context),
            separatorBuilder: (context,index) => Container(
              width: double.infinity,
              height: 2.0,
              color: Colors.black,
            ),
            itemCount: 10 ,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
