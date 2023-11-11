import 'package:bloc/bloc.dart';
import 'package:flutter_application_course/utils/cache.dart';
import 'package:flutter_application_course/utils/dio_hepler.dart';
import 'package:flutter_application_course/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthCubit get(context) => BlocProvider.of(context);
  ProfileModel? profileModel;

  login({required String? email, required String? password}) {
    emit(LoginLoadingState());
    DioHelper.post(path: "login", data: {"email": email, "password": password})
        .then((value) {
      value?.data["data"] != null
          ? profileModel = ProfileModel.fromJson(value?.data["data"])
          : null;
      CacheHelper.setString(key: "token", value: "${profileModel?.token}");
      print(value?.data);
      emit(LoginSuccessState(status: value?.data["status"]));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }
}
