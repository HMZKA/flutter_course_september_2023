part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class ChangeIndexState extends AppState {}

class LoadingBusinessState extends AppState {}

class GetBusinessSuccessState extends AppState {}

class GetBusinessFailureState extends AppState {}
