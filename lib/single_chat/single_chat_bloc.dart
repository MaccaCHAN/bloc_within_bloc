import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'single_chat_event.dart';
part 'single_chat_state.dart';

class SingleChatBloc extends Bloc<SingleChatEvent, SingleChatState> {
  SingleChatBloc() : super(SingleChatInitial(0)) {
    on<AddSingleChatEvent>((event, emit) {
      int numberOfMsg = state.NumberOfMsg + 1;
      emit(SingleChatSuccess(numberOfMsg));
    });
  }
}
