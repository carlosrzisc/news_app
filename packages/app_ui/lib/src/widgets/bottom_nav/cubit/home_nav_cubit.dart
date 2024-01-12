import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavCubit extends Cubit<int> {
  HomeNavCubit([super.initialState = 0]);

  void navigate(int index) => emit(index);
}
