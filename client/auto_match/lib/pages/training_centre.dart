import 'package:AUTO_MATCH/pages/button_bar.dart';
import 'package:AUTO_MATCH/pages/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Training_centre extends StatefulWidget {
  const Training_centre({Key? key}) : super(key: key);

  @override
  _Training_centreState createState() => _Training_centreState();
}

class _Training_centreState extends State<Training_centre> {
  List<bool> expanded = [false, false, false, false]; // Expansion panel status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches'),
        backgroundColor: Colors.redAccent, // Adjust as needed
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              expanded[panelIndex] = !expanded[panelIndex];
            });
          },
          children: [
            buildExpansionPanel('Face Training', Icons.face, [
              {'title': 'Button 1', 'url': '/url1'},
              {'title': 'Button 2', 'url': '/url2'},
              // Add more buttons as needed
            ], 0),
            buildExpansionPanel('Submit Reels', Icons.video_collection, [
              {'title': 'Button 1', 'url': '/url1'},
              {'title': 'Button 2', 'url': '/url2'},
              // Add more buttons as needed
            ], 1),
            buildExpansionPanel('Submit Songs', Icons.music_note, [
              {'title': 'Button 1', 'url': '/url1'},
              {'title': 'Button 2', 'url': '/url2'},
              // Add more buttons as needed
            ], 2),
            buildExpansionPanel('Adjust Filters', Icons.filter_list, [
              {'title': 'Button 1', 'url': '/url1'},
              {'title': 'Button 2', 'url': '/url2'},
              // Add more buttons as needed
            ], 3),
          ],
        ),
      ),
    );
  }

  ExpansionPanel buildExpansionPanel(
      String title, IconData icon, List<Map<String, String>> buttonsData, int index) {
    return ExpansionPanel(
      headerBuilder: (context, isOpen) {
        return ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        );
      },
      body: Column(
        children: buttonsData
            .map(
              (data) =>
                  buildExpansionPanelButton(data['title']!, data['url']!),
            )
            .toList(),
      ),
      isExpanded: expanded[index],
    );
  }

  Widget buildExpansionPanelButton(String title, String url) {
    return TextButton(
      onPressed: () {
        print('Navigating to: $url');
        // Uncomment if needed
        // print(dotenv.env['SERVER_URL']);
        Navigator.pushNamed(context, url, arguments: {'pop': true});
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        width: double.infinity,
        height: 61,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Color(0xff2c2c2c),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}











class best_Training_centre extends StatefulWidget {
  const best_Training_centre({super.key});

  @override
  best_Training_centreState createState() => best_Training_centreState();
}

class best_Training_centreState extends State<best_Training_centre> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyTopBar('Training centre'),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30 * fem),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildExpansionPanel(
                      'Face Training',
                      '/training_centre_faces',
                      Icons.face,
                      [
                        {'title': 'Button 1', 'url': '/url1'},
                        {'title': 'Button 2', 'url': '/url2'},
                        // Add more buttons as needed
                      ],
                    ),
                    buildExpansionPanel(
                      'Submit Reels',
                      '/sign_up_reels',
                      Icons.video_collection,
                      [
                        {'title': 'Button 1', 'url': '/url1'},
                        {'title': 'Button 2', 'url': '/url2'},
                        // Add more buttons as needed
                      ],
                    ),
                    buildExpansionPanel(
                      'Submit Songs',
                      '/sign_up_songs',
                      Icons.music_note,
                      [
                        {'title': 'Button 1', 'url': '/url1'},
                        {'title': 'Button 2', 'url': '/url2'},
                        // Add more buttons as needed
                      ],
                    ),
                    buildExpansionPanel(
                      'Adjust Filters',
                      '/sign_up_filters',
                      Icons.filter_list,
                      [
                        {'title': 'Button 1', 'url': '/url1'},
                        {'title': 'Button 2', 'url': '/url2'},
                        // Add more buttons as needed
                      ],
                    ),
                  ],
                ),
              ),
            ),
            MyButtonBar('training_centre'),
          ],
        ),
      ),
    );
  }

  Widget buildExpansionPanel(
    String title,
    String url,
    IconData icon,
    List<Map<String, String>> buttonsData,
  ) {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (int index, bool isExpanded) {
        print('wow!');
        setState(() {
          // Toggle the expansion state
          // You can store the expansion state for each panel if needed
          // and manage it accordingly
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Icon(icon),
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            );
          },
          body: Column(
            children: buttonsData
                .map(
                  (data) =>
                      buildExpansionPanelButton(data['title']!, data['url']!),
                )
                .toList(),
          ),
          isExpanded: false, // Set initial expansion state
        ),
      ],
    );
  }

  Widget buildExpansionPanelButton(String title, String url) {
    return TextButton(
      onPressed: () {
        print('Navigating to: $url');
        print(dotenv.env['SERVER_URL']);
        Navigator.pushNamed(context, url, arguments: {'pop': true});
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        width: double.infinity,
        height: 61,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Color(0xff2c2c2c),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}
