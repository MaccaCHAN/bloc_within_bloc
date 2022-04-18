part of 'chats_bloc.dart';

@immutable
abstract class ChatsEvent extends Equatable {
}

class AddChatEvent extends ChatsEvent {

  @override
  List<Object?> get props => [];
}

class DeleteChatEvent extends ChatsEvent {

  @override
  List<Object?> get props => [];
}