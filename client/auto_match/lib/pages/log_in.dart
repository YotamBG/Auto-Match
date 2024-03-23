import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/auth.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class Log_in extends StatefulWidget {
  const Log_in({super.key});

  @override
  Log_inState createState() => Log_inState();
}

class Log_inState extends State<Log_in> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle the sign-in action
  Future<void> signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Perform authentication
    print(email);
    print(password);

    final signInStatus = await signInReq(
      email: email,
      password: password,
    );

    print('Sign-In Status: $signInStatus');

    //move to the next screeen
    Navigator.pushNamed(context, '/matches');
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: SizedBox(
        width: double.infinity,
        child: Container(
          // signinBwT (403:28)
          padding:
              EdgeInsets.fromLTRB(41 * fem, 20 * fem, 42.53 * fem, 189 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // logobNu (403:48)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1.47 * fem, 43 * fem),
                width: 132 * fem,
                height: 130 * fem,
                child: Image.asset(
                  'assets/page-1/images/logo-zBf.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                // signin4GV (403:29)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 2.47 * fem, 63 * fem),
                child: Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Plus Jakarta Sans',
                    fontSize: 40 * ffem,
                    fontWeight: FontWeight.w300,
                    height: 1.26 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                // emailinputunu (403:43)
                margin:
                    EdgeInsets.fromLTRB(1.47 * fem, 0 * fem, 0 * fem, 39 * fem),
                width: 290 * fem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Color(0xfff4f3f3),
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(
                        21.53 * fem, 15 * fem, 21.53 * fem, 17 * fem),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Color(0xffa4a4a4)),
                  ),
                  style: SafeGoogleFont(
                    'Plus Jakarta Sans',
                    fontSize: 19 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.26 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                // passwordinputJa9 (403:44)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1.47 * fem, 89 * fem),
                width: 290 * fem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Color(0xfff4f3f3),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(
                        24 * fem, 15 * fem, 24 * fem, 17 * fem),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Color(0xffa4a4a4)),
                  ),
                  style: SafeGoogleFont(
                    'Plus Jakarta Sans',
                    fontSize: 19 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.26 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                // signinbuttonJiZ (403:31)
                margin:
                    EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0.47 * fem, 0 * fem),
                child: TextButton(
                  onPressed: () {
                    signIn();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 71 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff2c2c2c),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Plus Jakarta Sans',
                          fontSize: 24 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.26 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    ));
  }
}
