import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/auth.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class Sign_up_info extends StatefulWidget {
  const Sign_up_info({super.key});

  @override
  State<Sign_up_info> createState() => _Sign_up_infoState();
}

class _Sign_up_infoState extends State<Sign_up_info> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Function to handle the sign-in action
  Future<void> signUp() async {
    //show loading
    loading(context);

    final email = _emailController.text;
    final password = _passwordController.text;
    final name = '${_firstNameController.text} ${_lastNameController.text}';
    const bio = 'bio';
    const location = 'TLV';
    final age = _ageController.text;

    // Register user
    final signUpStatus = await signUpReq(
        email: email,
        password: password,
        name: name,
        bio: bio,
        location: location,
        age: int.parse(age));
    print('Sign-Up Status: $signUpStatus');

    // Sign in user
    final signInStatus = await signInReq(
      email: email,
      password: password,
    );
    print('Sign-In Status: $signInStatus');

    //Hide loading
    Navigator.of(context).pop();

    //Move to the next screeen
    Navigator.pushNamed(context, '/sign_up_memo', arguments: {'memoNum': 2});
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
          // signup18eZ (405:142)
          padding: EdgeInsets.fromLTRB(38 * fem, 25 * fem, 43 * fem, 81 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // logopnH (405:153)
                margin:
                    EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 29 * fem),
                width: 132 * fem,
                height: 130 * fem,
                child: Image.asset(
                  'assets/page-1/images/logo-mcq.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                // signupwru (405:143)
                margin:
                    EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 52 * fem),
                child: Text(
                  'Sign up',
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
                // emailinputemK (405:147)
                margin:
                    EdgeInsets.fromLTRB(3 * fem, 0 * fem, 1 * fem, 33 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Color(0xfff4f3f3),
                ),
                child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(
                        17.53 * fem, 15 * fem, 17.53 * fem, 17 * fem),
                    hintText: 'First name',
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
                // passwordinput5rd (405:150)
                margin:
                    EdgeInsets.fromLTRB(2 * fem, 0 * fem, 2 * fem, 33 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Color(0xfff4f3f3),
                ),
                child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(
                        19 * fem, 15 * fem, 19 * fem, 17 * fem),
                    hintText: 'Last name',
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
              // TODO Add bio and contact fields
              Container(
                // passwordinput5rd (405:150)
                margin:
                    EdgeInsets.fromLTRB(2 * fem, 0 * fem, 2 * fem, 33 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Color(0xfff4f3f3),
                ),
                child: TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(
                        19 * fem, 15 * fem, 19 * fem, 17 * fem),
                    hintText: 'Age',
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
                // emailinputXid (405:154)
                margin:
                    EdgeInsets.fromLTRB(1 * fem, 0 * fem, 3 * fem, 33 * fem),
                width: double.infinity,
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
                // passwordinputMxZ (405:157)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 4 * fem, 50 * fem),
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
                // signinbuttonPuF (405:144)
                margin: EdgeInsets.fromLTRB(4 * fem, 0 * fem, 0 * fem, 0 * fem),
                child: TextButton(
                  onPressed: () {
                    signUp();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 290 * fem,
                    height: 71 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff2c2c2c),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
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
