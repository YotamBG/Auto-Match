import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: 
      Center(
        child: Column(
          children: [
            Text('HOME!'),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () => Navigator.pushNamed(context, '/signUp'),
                child: Text('signUp'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () => Navigator.pushNamed(context, '/signIn'),
                child: Text('signIn'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () => Navigator.pushNamed(context, '/faces'),
                child: Text('FaceSelectionPage'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () => Navigator.pushNamed(context, '/submitMusic'),
                child: Text('Submit Music'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () => Navigator.pushNamed(context, '/submitReels'),
                child: Text('Submit Reels'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () => Navigator.pushNamed(context, '/submitFace'),
                child: Text('Submit Face'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () => Navigator.pushNamed(context, '/myProfile'),
                child: Text('profile'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () => Navigator.pushNamed(context, '/matches'),
                child: Text('matches!'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ),
                onPressed: () => Navigator.pushNamed(context, '/OpeningScreen'),
                child: Text('OpeningScreen!'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
