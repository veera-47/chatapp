import 'package:chatapp/model/chat_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF128C7E),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Color(0xFF075E54),
          leadingWidth: 90,
          titleSpacing: 5,
          leading: Row(
            children: [
              BackButton(
                color: Colors.white,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  widget.chatModel.isGroup
                      ? 'assets/svg/groups.svg'
                      : 'assets/svg/person.svg',
                  // ignore: deprecated_member_use
                  color: Colors.white,
                  height: 36,
                  width: 36,
                ),
              )
            ],
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    'Last seen 2hr ago',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.videocam,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
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
                      child: Text('View Contact'),
                      value: 'View Contact',
                    ),
                    PopupMenuItem(
                      child: Text('Media, links and docs'),
                      value: 'Media, links and docs',
                    ),
                    PopupMenuItem(
                      child: Text('Whatsup Web'),
                      value: 'Whatsup Web',
                    ),
                    PopupMenuItem(
                      child: Text('Search'),
                      value: 'Search',
                    ),
                    PopupMenuItem(
                      child: Text('Mute Notifications'),
                      value: 'Mute Notifications',
                    ),
                    PopupMenuItem(
                      child: Text('Wallpaper'),
                      value: 'Wallpaper',
                    )
                  ];
                })
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin:
                                EdgeInsets.only(right: 2, left: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 7,
                              minLines: 1,
                              decoration: InputDecoration(
                                  hintText: "Type veera",
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        setState(() {
                                          show = !show;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.emoji_emotions,
                                        color: Color(0xFF128C7E),
                                      )),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (builder) =>
                                                    bottomSheet());
                                          },
                                          icon: Icon(Icons.attach_file,
                                              color: Color(0xFF128C7E))),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.camera,
                                              color: Color(0xFF128C7E)))
                                    ],
                                  ),
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, right: 2, left: 2),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.green,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      ],
                    ),
                    show ? emojiSelect() : Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, 'Document'),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, 'Camera'),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, 'Gallery'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, 'Audio'),
                  SizedBox(
                    width: 45,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, 'Location'),
                  SizedBox(
                    width: 45,
                  ),
                  iconCreation(Icons.person, Colors.blue, 'Contact'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        if (emoji.emoji != null) {
          setState(() {
            _controller.text += emoji.emoji!;
          });
        }
      },
    );
  }
}
