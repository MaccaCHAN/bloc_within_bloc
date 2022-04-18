part of 'single_chat_bloc.dart';

abstract class SingleChatState extends Equatable {
  final int NumberOfMsg;
  const SingleChatState(this.NumberOfMsg);
}

class SingleChatInitial extends SingleChatState {
  const SingleChatInitial(int NumberOfMsg) : super(NumberOfMsg);

  @override
  List<Object> get props => [NumberOfMsg];
}

class SingleChatLoading extends SingleChatState {
  const SingleChatLoading(int NumberOfMsg) : super(NumberOfMsg);

  @override
  List<Object> get props => [NumberOfMsg];
}

class SingleChatSuccess extends SingleChatState {
  const SingleChatSuccess(int NumberOfMsg) : super(NumberOfMsg);

  @override
  List<Object> get props => [NumberOfMsg];
}
