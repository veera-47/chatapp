import 'package:chatapp/customui/button_card.dart';
import 'package:chatapp/customui/contact_card.dart';
import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/screens/select_group.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<SelectModel> contacts = [
      SelectModel(name: 'Abhishek', status: "Play with Fire"),
      SelectModel(name: 'Head', status: "Play with Fire"),
      SelectModel(name: 'Kishan', status: "Play with Fire"),
      SelectModel(name: 'Nitish', status: "Play with Fire"),
      SelectModel(name: 'Classen', status: "Play with Fire"),
      SelectModel(name: 'Mulder', status: "Play with Fire"),
      SelectModel(name: 'Mendis', status: "Play with Fire"),
      SelectModel(name: 'Cummins', status: "Play with Fire"),
      SelectModel(name: 'Harshal', status: "Play with Fire"),
      SelectModel(name: 'Shami', status: "Play with Fire"),
      SelectModel(name: 'Rahul', status: "Play with Fire"),
      SelectModel(name: 'Zampa', status: "Play with Fire"),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF075E54),
          leading: BackButton(
            color: Colors.white,
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Contact',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                '247 contacts',
                style: TextStyle(fontSize: 15, color: Colors.white),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            PopupMenuButton<String>(
                onSelected: (value) {
                  print(value);
                },
                color: Colors.white,
                iconColor: Colors.white,
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text('Invite a Friend'),
                      value: 'Invite a Friend',
                    ),
                    PopupMenuItem(
                      child: Text('Contacts'),
                      value: 'Contacts',
                    ),
                    PopupMenuItem(
                      child: Text('Refresh'),
                      value: 'Refresh',
                    ),
                    PopupMenuItem(
                      child: Text('Help'),
                      value: 'Help',
                    ),
                  ];
                })
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => SelectGroup()));
                    },
                    child: ButtonCard(name: 'New Group', icon: Icons.group));
              }
              if (index == 1) {
                return ButtonCard(name: 'Person Add', icon: Icons.person);
              }
              return ContactCard(contact: contacts[index - 2]);
            }));
  }
}
