import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerece_c11_sun/features/main_layout/cubit/home_screen_states.dart';

import '../categories/presentation/categories_tab.dart';
import '../favourite/presentation/favourite_screen.dart';
import '../home/presentation/home_tab.dart';
import '../profile_tab/presentation/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialState());

  //todo: hold data - handle logic
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    const CategoriesTab(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];

  void changeSelectedIndex(int newIndex) {
    emit(HomeScreenInitialState());
    currentIndex = newIndex;
    emit(ChangeSelectedIndexState());
  }
}
