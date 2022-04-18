import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc() : super(ChatsInitial(0)) {
    on<AddChatEvent>((event, emit) {
      int numberOfGroups = state.numberOfGroups + 1;
      print("NumberOfGroups: $numberOfGroups");
      emit(ChatsSuccess(numberOfGroups));
    });
    on<DeleteChatEvent>((event, emit) {
      int numberOfGroups;
      if (state.numberOfGroups > 0) {
      numberOfGroups = state.numberOfGroups - 1;}
      else {
        numberOfGroups = state.numberOfGroups;
      }
      print("NumberOfGroups: $numberOfGroups");
      emit(ChatsSuccess(numberOfGroups));
    });
  }
}
