part of 'chats_bloc.dart';

abstract class ChatsState extends Equatable {
  ChatsState();
}

class ChatsInitial extends ChatsState {
  final int numberOfGroups;
  ChatsInitial(this.numberOfGroups)  ;

  @override
  List<Object> get props => [numberOfGroups];
}

// class ChatsLoading extends ChatsState {
//   ChatsLoading(int numberOfGroups) : super(numberOfGroups);
//
//   @override
//   List<Object> get props => [];
// }
class ChatsSuccess extends ChatsState {
  final int numberOfGroups;
  ChatsSuccess(this.numberOfGroups);

  @override
  List<Object?> get props => [numberOfGroups];
}

