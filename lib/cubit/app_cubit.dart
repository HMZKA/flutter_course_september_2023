import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);

  ImagePicker picker = ImagePicker();
  XFile? file;
  pickImage() async {
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      file = value;

      emit(PickImageState());
    }).catchError((error) {
      print(error.toString());
    });
  }
}
