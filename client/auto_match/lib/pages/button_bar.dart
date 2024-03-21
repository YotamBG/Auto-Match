import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyButtonBar extends StatefulWidget {
  final String page; // Add this line to define the page variable

  const MyButtonBar(this.page);

  @override
  _MyButtonBarState createState() => _MyButtonBarState();
}

class _MyButtonBarState extends State<MyButtonBar> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 2, // Negative spread radius makes the shadow go up
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/all_users');
            },
            style: TextButton.styleFrom(
              backgroundColor: widget.page == 'all_users'
                  ? Color(0xff2c2c2c) : Color.fromARGB(255, 255, 255, 255),
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15 * fem),
              ),
              side: BorderSide(
                color: Colors.transparent,
                width: 2.0,
              ),
              elevation: widget.page != 'all_users' ? 5.0 : 0.0,
            ),
            child: Container(
              width: 100*ffem,
              height: 50,
              child: Center(
                child: Text(
                  'All Users',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Plus Jakarta Sans',
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.26 * ffem / fem,
                    color: widget.page != 'all_users'
                  ? Color(0xff2c2c2c) : Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/matches');
            },
            style: TextButton.styleFrom(
              backgroundColor:
                  widget.page == 'matches'
                  ? Color(0xff2c2c2c) : Color.fromARGB(255, 255, 255, 255),
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15 * fem),
              ),
              side: BorderSide(
                color: Colors.transparent,
                width: 2.0,
              ),
              elevation: widget.page != 'matches' ? 5.0 : 0.0,
            ),
            child: Container(
              width: 100*ffem,
              height: 50,
              child: Center(
                child: Text(
                  'Matches',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Plus Jakarta Sans',
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.26 * ffem / fem,
                    color: widget.page != 'matches'
                  ? Color(0xff2c2c2c) : Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/training_centre');
            },
            style: TextButton.styleFrom(
              backgroundColor: widget.page == 'training_centre' 
                  ? Color(0xff2c2c2c) : Color.fromARGB(255, 255, 255, 255),
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15 * fem),
              ),
              side: BorderSide(
                color: Colors.transparent,
                width: 2.0,
              ),
              elevation: widget.page != 'training_centre' ? 5.0 : 0.0,
            ),
            child: Container(
              width: 100*ffem,
              height: 50,
              child: Center(
                child: Text(
                  'Training Centre',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Plus Jakarta Sans',
                    fontSize: 14 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.26 * ffem / fem,
                    color: widget.page != 'training_centre' 
                  ? Color(0xff2c2c2c) : Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
