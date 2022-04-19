import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'chats_event.dart';
part 'chats_state.dart';


class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc() :  super(ChatsInitial(0)) {
    on<AddChatEvent>((event, emit) {
      groups = groups + 1;
      print("NumberOfGroups: $groups");
      emit(ChatsSuccess(groups));
    });
    on<DeleteChatEvent>((event, emit) {
      if (groups > 0) {
      groups = groups - 1;}
      print("NumberOfGroups: $groups");
      emit(ChatsSuccess(groups));
    });

  }
  int groups = 0;
}
