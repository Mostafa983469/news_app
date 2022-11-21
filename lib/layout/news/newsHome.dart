import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/search/Search.dart';
import 'cubic/cubic.dart';
import 'cubic/states.dart';


class NewsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var cubic = NewsCubic.get(context);
    return  BlocConsumer<NewsCubic , NewsStates>(
        listener: (context , state){},
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(
              title: Text('News'),
              actions: [
                IconButton(
                  onPressed:()
                  {
                  NewsCubic.get(context).ChangeMode();
                  },
                    icon:Icon(
                    Icons.dark_mode
                ),
                ),
                IconButton(
                    onPressed:()
                    {
                      Navigator.push(context,MaterialPageRoute(
                        builder: (context) => Search(),
                      ), );
                    } ,
                    icon:
                      Icon(
                        Icons.search
                      )
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                onTap: (index){
                  NewsCubic.get(context).ChangeIndex(index);
                },
                currentIndex: NewsCubic.get(context).CurrentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.newspaper),
                    label: 'news',
                  ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_baseball),
                  label: 'sports',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.science),
                  label: 'science',
                ),
                ],
            ),
            body: NewsCubic.get(context).screen[NewsCubic.get(context).CurrentIndex],
          );
        });


  }
}
