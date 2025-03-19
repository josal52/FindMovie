import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBarCubit extends Cubit<String> {
  CustomAppBarCubit() : super('Search movies');

  void updateTitle(String title) {
    emit(title);
  }
}
