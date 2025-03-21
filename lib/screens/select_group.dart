import 'package:chatapp/customui/avtar_card.dart';
import 'package:chatapp/customui/contact_card.dart';
import 'package:chatapp/model/chat_model.dart';
import 'package:flutter/material.dart';

class SelectGroup extends StatefulWidget {
  const SelectGroup({super.key});

  @override
  State<SelectGroup> createState() => _SelectGroupState();
}

class _SelectGroupState extends State<SelectGroup> {
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

  List<SelectModel> groups = [];
  @override
  Widget build(BuildContext context) {
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
                'New Group',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Add Participants',
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
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groups.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                      onTap: () {
                        if (contacts[index - 1].select == false) {
                          setState(() {
                            contacts[index - 1].select = true;
                            groups.add(contacts[index - 1]);
                          });
                        } else {
                          setState(() {
                            contacts[index - 1].select = false;
                            groups.remove(contacts[index - 1]);
                          });
                        }
                      },
                      child: ContactCard(contact: contacts[index - 1]));
                }),
            groups.length > 0
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              if (contacts[index].select == true) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        groups.remove(contacts[index]);
                                        contacts[index].select = false;
                                      });
                                    },
                                    child: AvtarCard(contact: contacts[index]));
                              } else {
                                return Container();
                              }
                            }),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
