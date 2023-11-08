part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class ChangeIndexState extends AppState {}

class GetHomeDataLoadingState extends AppState {}

class GetHomeDataSuccessState extends AppState {}

class GetHomeDataErrorState extends AppState {}

class GetCategoriesDataLoadingState extends AppState {}

class GetCategoriesDataSuccessState extends AppState {}

class GetCategoriesDataErrorState extends AppState {}

class GetCategoriesDetailsDataLoadingState extends AppState {}

class GetCategoriesDetailsDataSuccessState extends AppState {}

class GetCategoriesDetailsDataErrorState extends AppState {}
