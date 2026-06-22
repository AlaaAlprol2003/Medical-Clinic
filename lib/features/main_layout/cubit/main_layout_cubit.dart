import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());
  int selectedTab = 0;

  void changeTab({required int index}) {
    selectedTab = index;
    emit(SelectedTabState());
  }
}