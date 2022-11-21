import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/news/cubic/cubic.dart';
import '../../layout/news/cubic/states.dart';
import '../../shared/components/components.dart';

class Search extends StatelessWidget {
  var text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubic,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.all(20.0),
                  child: TextFormField(
                    onChanged: (value){
                      NewsCubic.get(context).GetSearch(value);
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon:Icon(Icons.search,color: Colors.grey,),
                    ),
                  )
              ),
              Expanded(child:  ConditionalBuilder(
                   condition: NewsCubic.get(context).search.isNotEmpty ,
                   builder: (context) =>  ListView.separated(
                     itemBuilder: (context,index) => List(NewsCubic.get(context).search[index],context),
                     separatorBuilder: (context,index) => Container(
                       width: double.infinity,
                       height: 2.0,
                       color: Colors.black,
                     ),
                     itemCount: 10 ,
                   ),
                 )
              ),
            ],
        ),
        );

      },
    );
  }
}
