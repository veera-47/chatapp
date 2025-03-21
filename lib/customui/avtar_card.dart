import 'package:chatapp/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvtarCard extends StatelessWidget {
  const AvtarCard({super.key, required this.contact});
  final SelectModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  'assets/svg/person.svg',
                  color: Colors.white,
                  height: 30,
                  width: 30,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 1,
          ),
          Text(contact.name)
        ],
      ),
    );
  }
}
