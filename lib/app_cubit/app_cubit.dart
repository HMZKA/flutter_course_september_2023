import 'package:bloc/bloc.dart';
import 'package:flutter_application_course/dio_hepler.dart';
import 'package:flutter_application_course/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  getHome() {
    emit(GetHomeDataLoadingState());
    DioHelper.get(path: "home").then((value) {
      homeModel = HomeModel.formJson(value?.data);
      print(homeModel?.data?.products[0].image);
      emit(GetHomeDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetHomeDataErrorState());
    });
  }
}
