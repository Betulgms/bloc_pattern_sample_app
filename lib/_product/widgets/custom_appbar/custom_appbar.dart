import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {
  final String linkImage;
  CustomAppbar({
    this.linkImage = "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    Key? key,
  }) : super(
          foregroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(linkImage),
            ),
          ),
          actions: [
            const Icon(
              Icons.search,
              color: Color(0xffFF5959),
              size: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.notifications,
              color: Color(0xffFF5959),
              size: 40,
            ),
          ],
          backgroundColor: Colors.white,
        );
}
