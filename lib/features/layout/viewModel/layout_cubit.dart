import 'package:autism/features/home/presentation/views/home_view.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'layout_state.dart';



class LayoutCubit extends Cubit<LayoutStates>
{
  LayoutCubit():super(LayoutInitialStates());
  static LayoutCubit get(context)=>BlocProvider.of(context);

  List<Widget>screens=[
    const HomeView(),
    Column(),
    Column(),
    Column(),
  ];

  int currentIndex=0;

  void changeCurrentIndex(index)
  {
    currentIndex=index;
    emit(LayoutChangeCurrentIndexStates());
  }
}
