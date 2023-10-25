import 'package:bloc/bloc.dart';
import 'package:flutter_application_course/dio_helper.dart';
import 'package:flutter_application_course/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  changeTheme() {
    isDark = !isDark;
    emit(ChangeThemeState());
  }

  int index = 0;
  currentIndex(value) {
    index = value;
    emit(ChangeIndexState());
  }

  NewsModel? newsModel;
  getBusinessNews() {
    emit(LoadingBusinessState());
    DioHelper.get(path: "top-headlines", queryParameters: {
      "country": "us",
      "category": "business",
      "apiKey": "a269e4f1de864efc85f38b36f1bae318"
    }).then((value) {
      newsModel = NewsModel.fromJson(value?.data);
      emit(GetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessFailureState());
    });
  }

  NewsModel? sportNews;

  getSportNews() {
    emit(LoadingSportState());
    DioHelper.get(path: "top-headlines", queryParameters: {
      "country": "us",
      "category": "sport",
      "apiKey": "a269e4f1de864efc85f38b36f1bae318"
    }).then((value) {
      sportNews = NewsModel.fromJson(value?.data);
      emit(GetSportSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSportFailureState());
    });
  }

  NewsModel? searchModel;
  search({required String search}) {
    emit(SearchLoadingState());
    DioHelper.get(path: "everything", queryParameters: {
      "q": search,
      "apiKey": "a269e4f1de864efc85f38b36f1bae318"
    }).then((value) {
      searchModel = NewsModel.fromJson(value?.data);
      print(value!.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
