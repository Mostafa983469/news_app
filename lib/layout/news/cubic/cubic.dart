import 'package:bloc/bloc.dart';
import 'package:News_App/layout/news/cubic/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/business_news/business_news.dart';
import '../../../modules/science_news/science_news.dart';
import '../../../modules/sports_news/sports_news.dart';
import '../../../shared/network/local/sharred.dart';
import '../../../shared/network/remote/Dio.dart';

class NewsCubic extends Cubit<NewsStates>{
  NewsCubic() : super(intilState());
  static NewsCubic get(context) => BlocProvider.of(context);
  List<Widget> screen = [business(), sports(), Science(),];
  int CurrentIndex = 0;
  bool isDark = false;

  void ChangeMode({bool? isdark}){
    // set value from shared_preferences
    if(isdark != null){
      isDark = isdark;
      emit(ChangeModeState());
    }
    // change value of Mode
    else {
      isDark = !isDark;
      Sharred.putBool(key: 'isdark', value: isDark).then((value) {
        emit(ChangeModeState());
      });
      }
  }

  void ChangeIndex(int index){
    CurrentIndex = index ;
    emit(ChangeIndexState());
  }

  List<dynamic> news = [];
  void GetNews(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'c0a30da2424f417b87e6a9734f45d9b7',
        },
    ).then((value) {
      emit(GetBusinessState());
      news = value.data['articles'];
      if (kDebugMode) {
        print('sucsess');
      }
    }).catchError((Error) {
      emit(NotGetBusinessState());
      print('not sucess');
    } );

  }

  List<dynamic> sport = [];
  void GetSport(){
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'sports',
        'apiKey':'c0a30da2424f417b87e6a9734f45d9b7',
      },
    ).then((value) {
      emit(GetsportsState());
      sport = value.data['articles'];
      if (kDebugMode) {
        print('sucsess');
      }
    }).catchError((Error) {
      emit(NotGetsportsState());
      print('not sucess');
    } );

  }

  List<dynamic> science = [];
  void GetScience(){
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'science',
        'apiKey':'c0a30da2424f417b87e6a9734f45d9b7',
      },
    ).then((value) {
      emit(GetscienceState());
      science = value.data['articles'];
      if (kDebugMode) {
        print('sucsess');
      }
    }).catchError((Error) {
      emit(NotGetsciencesState());
      print('not sucess');
    } );

  }

  List<dynamic> search = [];
  void GetSearch(String value){
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'c0a30da2424f417b87e6a9734f45d9b7',
      },
    ).then((value) {
      search = value.data['articles'];
      if (kDebugMode) {
        print('sucsess');
      }
      emit(GetsearchState());
    }).catchError((Error) {
      print('not sucess');
      emit(NotGetsearchState());
    });
  }
}