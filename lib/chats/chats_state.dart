part of 'chats_bloc.dart';

abstract class ChatsState extends Equatable {
  final int numberOfGroups;
  ChatsState(this.numberOfGroups);
}

class ChatsInitial extends ChatsState {

  ChatsInitial(int numberOfGroups) : super(numberOfGroups) ;

  @override
  List<Object> get props => [];
}

// class ChatsLoading extends ChatsState {
//   ChatsLoading(int numberOfGroups) : super(numberOfGroups);
//
//   @override
//   List<Object> get props => [];
// }
class ChatsSuccess extends ChatsState {
  ChatsSuccess(int numberOfGroups) : super(numberOfGroups);

  @override
  List<Object?> get props => [numberOfGroups];
}

