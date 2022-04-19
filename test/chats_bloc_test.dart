

import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_within_bloc/chats/chats_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late ChatsBloc chatsBloc;

  setUp((){
    chatsBloc = ChatsBloc();

  });


  blocTest('should return 3 when add three groups',
      build: () {  return chatsBloc; },

      act: (ChatsBloc bloc) {
       bloc.add(AddChatEvent());
       bloc.add(AddChatEvent());
       bloc.add(AddChatEvent());

      },
      expect: () {
        return [ChatsSuccess(1),
          ChatsSuccess(2),
          TypeMatcher<ChatsSuccess>()
              .having((ChatsSuccess) => ChatsSuccess.numberOfGroups, 'NumberOfGroups', equals(3))
        ];
      }

      );

  test(
    'should get 1 when addChatEvent once',
        () async {
      // arrange
       ChatsBloc bloc = chatsBloc;
      // act
      bloc.add(AddChatEvent());
      // assert
      // verify(()=>mockGetConcreteNumberTrivia(Params(number: tNumberParsed)));
      expect(bloc.groups, equals(1));
    },
  );


}