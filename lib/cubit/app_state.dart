part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class ChangeIndexState extends AppState {}

class ChangeThemeState extends AppState {}

class LoadingBusinessState extends AppState {}

class GetBusinessSuccessState extends AppState {}

class GetBusinessFailureState extends AppState {}

class LoadingSportState extends AppState {}

class GetSportSuccessState extends AppState {}

class GetSportFailureState extends AppState {}

class SearchLoadingState extends AppState {}

class SearchSuccessState extends AppState {}

class SearchErrorState extends AppState {}
