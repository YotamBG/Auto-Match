import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyButtonBar extends StatefulWidget {
  const MyButtonBar({super.key});

  @override
  _MyButtonBarState createState() => _MyButtonBarState();
}

class _MyButtonBarState extends State<MyButtonBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Color.fromARGB(255, 255, 255, 255),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(172, 196, 20, 20)),
                    onPressed: () {
                      // Handle button tap
                      Navigator.pushNamed(context, '/training_centre');
                    },
                    child: const Text('Training center'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(172, 196, 20, 20)),
                    onPressed: () {
                      // Handle button tap
                      Navigator.pushNamed(context, '/my_profile');
                    },
                    child: const Text('Profile'),
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
