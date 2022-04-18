import 'package:bloc_within_bloc/chats/chats_bloc.dart';
import 'package:bloc_within_bloc/single_chat/single_chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
            primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
          providers: [
            BlocProvider<ChatsBloc>(create: (context) => ChatsBloc()),
            // BlocProvider<SingleChatBloc>(create: (context) => SingleChatBloc()),

          ],
          child: const MyHomePage()),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc within Bloc Test')),
      body:

      Column(
        children: [UpperPartBuild(), LowerPartBuild()]

      ),


    );
  }
}

class UpperPartBuild extends StatelessWidget {
  const UpperPartBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children :[
        //Left button
        Column (children: [
          ElevatedButton(onPressed: (){
            BlocProvider.of<ChatsBloc>(context).add(AddChatEvent());
          }, child: Text('Add ChatGroup')),
          ElevatedButton(onPressed: (){
            BlocProvider.of<ChatsBloc>(context).add(DeleteChatEvent());
          }, child: Text('Remove ChatGroup')),

        ],),
        // SizedBox(width: 15,),
        // //Right button
        // Column (children: [
        //   ElevatedButton(onPressed: (){}, child: Text('Add ChatGroup Msg'))
        // ],),

      ]

    );
  }
}

class LowerPartBuild extends StatelessWidget {
  const LowerPartBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
        builder: (context, state) {
      if(state is ChatsInitial){
        return Container(child: Text('Empty'));
      }
      else if (state is ChatsSuccess) {
        int x = state.numberOfGroups;
        return ListView.builder(
            shrinkWrap: true,
            itemCount: x,
            itemBuilder: (context, x) {
              return BlocProvider<SingleChatBloc>(create: (context) => SingleChatBloc(),
              child:
              BlocBuilder<SingleChatBloc, SingleChatState>(builder: (context, state) {
                int y = state.NumberOfMsg;
                return ListTile(title: ElevatedButton(onPressed: () {
                  BlocProvider.of<SingleChatBloc>(context).add(AddSingleChatEvent());

                }, child: Text('Group $x; $y messages'),
                  style: ElevatedButton.styleFrom(primary: Colors.black45),
                ));
              } )
              );
        });
      }
      else {
        return Container(child: Text('Empty'));
      }
    });
  }
}




