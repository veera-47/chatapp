import 'package:chatapp/customui/custom_card.dart';
import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/screens/select_contact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Divakar",
        icon: "person.svg",
        time: "5:50pm",
        isGroup: false,
        currentMessage: "Where have to meet",
        status: 'Online'),
    ChatModel(
        name: "Modi",
        icon: "person.svg",
        time: "5:50am",
        isGroup: false,
        currentMessage: "Make India Proud",
        status: 'Online'),
    ChatModel(
        name: "Kohli",
        icon: "groups.svg",
        time: "9:00am",
        isGroup: true,
        currentMessage: "Come to Groud",
        status: ''),
    ChatModel(
        name: "Ben Stokes",
        icon: "perons.svg",
        time: "11:40am",
        isGroup: false,
        currentMessage: "you do until achieve",
        status: ''),
    ChatModel(
        name: "Jagan",
        icon: "groups.svg",
        time: "7:00pm",
        isGroup: true,
        currentMessage: "Never Step back",
        status: ''),
    ChatModel(
        name: "Chandra Babu",
        icon: "person.svg",
        time: "9:23 pm",
        isGroup: false,
        currentMessage: " Vision, Work",
        status: ''),
    ChatModel(
        name: "NTR",
        icon: "person.svg",
        time: "10:23 pm",
        isGroup: false,
        currentMessage: "nnnn tttt rrr",
        status: ''),
    ChatModel(
        name: "Vijay Dalapathi",
        icon: "person.svg",
        time: "7:23 am",
        isGroup: false,
        currentMessage: "vvvvvv dddd",
        status: ''),
    ChatModel(
        name: "Mahesh Babu",
        icon: "person.svg",
        time: "9:23pm",
        isGroup: false,
        currentMessage: "mmmm bbbbb",
        status: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => SelectContact()));
          },
          child: Icon(
            Icons.chat,
          ),
        ),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) =>
                CustomCard(chatModel: chats[index])));
  }
}
