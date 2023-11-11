import 'package:bloc/bloc.dart';
import 'package:flutter_application_course/models/categories_model.dart';
import 'package:flutter_application_course/utils/dio_hepler.dart';
import 'package:flutter_application_course/models/home_model.dart';
import 'package:flutter_application_course/models/product_model.dart';
import 'package:flutter_application_course/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);
  int index = 0;
  changeIndex(int value) {
    index = value;
    emit(ChangeIndexState());
  }

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

  CategoryModel? categoryModel;
  getCategories() {
    emit(GetCategoriesDataLoadingState());
    DioHelper.get(path: "categories").then((value) {
      categoryModel = CategoryModel.fromJson(value?.data["data"]);
      emit(GetCategoriesDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCategoriesDataErrorState());
    });
  }

  ProductModel? productModel;
  getCategoryDetails(id) {
    emit(GetCategoriesDetailsDataLoadingState());
    DioHelper.get(path: "categories/${id}").then((value) {
      productModel = ProductModel.fromJson(value?.data["data"]);
      print(productModel?.products[0].name);
      emit(GetCategoriesDetailsDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCategoriesDetailsDataErrorState());
    });
  }

  ProfileModel? profileModel;
  getProfile() {
    emit(GetProfileLoadingState());
    DioHelper.get(path: "profile").then((value) {
      profileModel = ProfileModel.fromJson(value?.data["data"]);
      print(value?.data);
      emit(GetProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorState());
    });
  }
}