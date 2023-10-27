import 'package:flutter/material.dart';

class MyStickyButtonBar extends StatefulWidget {
  @override
  _MyStickyButtonBarState createState() => _MyStickyButtonBarState();
}

class _MyStickyButtonBarState extends State<MyStickyButtonBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Content
        Container(
            // Your main content here
            ),
        // Sticky Button Bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              color: Color.fromARGB(60, 84, 9, 9), // Customize the background color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style:TextButton.styleFrom(backgroundColor: Color.fromARGB(172, 196, 20, 20)),
                    onPressed: () {
                      // Handle button tap
                    },
                    child: Text('Training center'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    style:TextButton.styleFrom(backgroundColor: Color.fromARGB(172, 196, 20, 20)),
                    onPressed: () {
                      // Handle button tap
                    },
                    child: Text('Profile'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
