import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyTopBar extends StatefulWidget {
  final String page; // Add this line to define the page variable

  const MyTopBar(this.page);

  @override
  _MyTopBarState createState() => _MyTopBarState();
}

class _MyTopBarState extends State<MyTopBar> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      // autogroupvhb9Tbb (TtqTC4ugbKqMdXFnvwvhB9)
      margin: EdgeInsets.fromLTRB(20 * fem, 15 * fem, 0 * fem, 27 * fem),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // logoNyT (403:62)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 8.5 * fem, 0 * fem),
            width: 51 * fem,
            height: 50 * fem,
            child: Image.asset(
              'assets/page-1/images/logo-VEu.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            // matchesiGd (403:52)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 2 * fem),
            child: Text(
              widget.page,
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Plus Jakarta Sans',
                fontSize: 30 * ffem,
                fontWeight: FontWeight.w300,
                height: 1.26 * ffem / fem,
                color: Color(0xff000000),
              ),
            ),
          ),
          Spacer(),
          Container(
            // alignment: Alignment.centerRight,
            // emailinputdTB (405:259)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 20 * fem, 0 * fem),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius:
                      1,
                  blurRadius: 2,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/my_profile');
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20 * fem),
                child: Image.asset(
                  'assets/page-1/images/image-1-kN9.png',
                  width: 35 * fem,
                  height: 35 * fem,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
