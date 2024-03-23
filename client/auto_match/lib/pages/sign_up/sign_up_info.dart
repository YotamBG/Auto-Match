import 'package:flutter_typeahead/flutter_typeahead.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final List<String> countries = [
    'Global',
    'Afghanistan',
    'Albania',
    'Algeria',
    'American Samoa',
    'Andorra',
    'Angola',
    'Anguilla',
    'Antarctica',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Aruba',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bermuda',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Bouvet Island',
    'Brazil',
    'British Indian Ocean Territory',
    'British Virgin Islands',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Cape Verde',
    'Cayman Islands',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Christmas Island',
    'Cocos (Keeling) Islands',
    'Colombia',
    'Comoros',
    'Congo',
    'Cook Islands',
    'Costa Rica',
    'Cote d\'Ivoire',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Democratic Republic of the Congo',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'East Timor',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Ethiopia',
    'Faeroe Islands',
    'Falkland Islands',
    'Fiji',
    'Finland',
    'Former Yugoslav Republic of Macedonia',
    'France',
    'French Guiana',
    'French Polynesia',
    'French Southern Territories',
    'Gabon',
    'Georgia',
    'Germany',
    'Ghana',
    'Gibraltar',
    'Greece',
    'Greenland',
    'Grenada',
    'Guadeloupe',
    'Guam',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Heard Island and McDonald Islands',
    'Honduras',
    'Hong Kong',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macau',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Martinique',
    'Mauritania',
    'Mauritius',
    'Mayotte',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Montserrat',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'Netherlands Antilles',
    'New Caledonia',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'Niue',
    'Norfolk Island',
    'North Korea',
    'Northern Marianas',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Pitcairn Islands',
    'Poland',
    'Portugal',
    'Puerto Rico',
    'Qatar',
    'Reunion',
    'Romania',
    'Russia',
    'Rwanda',
    'Sqo Tome and Principe',
    'Saint Helena',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Pierre and Miquelon',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Georgia and the South Sandwich Islands',
    'South Korea',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Svalbard and Jan Mayen',
    'Swaziland',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'The Bahamas',
    'The Gambia',
    'Togo',
    'Tokelau',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Turks and Caicos Islands',
    'Tuvalu',
    'Virgin Islands',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'United States Minor Outlying Islands',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
    'Venezuela',
    'Vietnam',
    'Wallis and Futuna',
    'Western Sahara',
    'Yemen',
    'Yugoslavia',
    'Zambia',
    'Zimbabwe',
  ];

  // Function to handle the sign-in action
  Future<void> signUp() async {
    //show loading
    loading(context);

    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;
    var location = _locationController.text;
    final bio = _bioController.text;
    final contact = _contactController.text;
    final age = _ageController.text;

    if (!countries.contains(location)) {
      location = 'Global';
    }
    ;
    print(
        'email: $email, password: $password, name: $name, location: $location, bio: $bio, age: $age');

    // Register user
    final signUpStatus = await signUpReq(
        email: email,
        password: password,
        name: name,
        bio: '$bio // $contact',
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
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(
                        17.53 * fem, 15 * fem, 17.53 * fem, 17 * fem),
                    hintText: 'Name',
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
              Row(
                children: [
                  Expanded(
                    flex: 4, // Location field occupies 3/5 of the space
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 33 * fem),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        color: Color(0xfff4f3f3),
                      ),
                      child: TypeAheadField(
                        controller: _locationController,
                        suggestionsCallback: (pattern) async {
                          if (pattern.isEmpty) {
                            // Return all countries if the pattern is empty
                            return countries;
                          } else {
                            // Filter countries based on the pattern
                            return countries
                                .where((country) => country
                                    .toLowerCase()
                                    .contains(pattern.toLowerCase()))
                                .toList();
                          }
                        },
                        itemBuilder: (context, String suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSelected: (String value) {
                          _locationController.text = value;
                        },
                        builder: (context, TextEditingController controller,
                            FocusNode focusNode) {
                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(
                                21.53 * fem,
                                15 * fem,
                                21.53 * fem,
                                17 * fem,
                              ),
                              hintText: 'Location',
                              hintStyle: TextStyle(color: Color(0xffa4a4a4)),
                            ),
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 19 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.26 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Add some space between fields
                  Expanded(
                    flex: 2, // Age field occupies 2/5 of the space
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 33 * fem),
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
                  ),
                ],
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
                  controller: _bioController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(
                        21.53 * fem, 15 * fem, 21.53 * fem, 17 * fem),
                    hintText: 'Bio',
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
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 33 * fem),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10 * fem),
                      color: Color(0xfff4f3f3),
                    ),
                    child: TextField(
                      controller: _contactController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(
                            21.53 * fem, 15 * fem, 21.53 * fem, 17 * fem),
                        hintText: 'Contact',
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
                    alignment: Alignment.centerRight,
                    padding:
                        EdgeInsets.fromLTRB(0 * fem, 5 * fem, 0 * fem, 0 * fem),
                    child: IconButton(
                      icon: Icon(Icons.info, color: Colors.grey),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Contact Information'),
                            content: Text(
                              'Please provide a way for other users to contact you. \n\n(social media handle, phone number, etc...)',
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
