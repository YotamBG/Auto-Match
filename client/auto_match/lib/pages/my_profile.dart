import 'dart:convert';
import 'package:AUTO_MATCH/main.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:AUTO_MATCH/pages/services/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class My_profile extends StatefulWidget {
  const My_profile({super.key});

  @override
  My_profileState createState() => My_profileState();
}

class My_profileState extends State<My_profile> {
  var currentUser;
  final TextEditingController _locationController = TextEditingController();
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

  var serverURL = dotenv.env["SERVER_URL"];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    try {
      // get user
      final currentUserObject = await profileReq();

      // profile_data = {
      //         'name': user.name,
      //         'bio': user.bio,
      //         'id': current_user.id,
      //         'location': user.location,
      //         'age': user.age,
      //     }
      setState(() {
        currentUser = currentUserObject;
      });
    } catch (e) {
      print('Error loading user profile: $e');
    }
  }

  Future<void> submitLocation() async {
    var location = _locationController.text;
    if (!countries.contains(location)) {
      location = 'Global';
    }
    print('submiting!! $location');

    // send req to server
    print('Sending req to server...');
    final jsonData = {
      "location": location,
    };
    print('jsonData:');
    print(jsonData);

    final songsReq = await api.dio.put(
      '${dotenv.env["SERVER_URL"]}/profile/update',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: jsonEncode(jsonData),
    );

    final filtersReqResponse = songsReq.data.toString();
    print('Server Response!!: $filtersReqResponse');

    //hide loading
    Navigator.of(context).pop();
  }

  Future<void> logout() async {
    final fetchResponse =
        await api.dio.post('${dotenv.env["SERVER_URL"]}/logout');
    final responseBody = fetchResponse.data.toString();
    await api.clearCookies();
    await sessionManager.logout();

    print('responseBody: $responseBody');

    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: currentUser == null
              ? Container()
              : SizedBox(
                  width: double.infinity,
                  child: Container(
                    width: double.infinity,
                    height: 812 * fem,
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 150 * fem,
                                height: 150 * fem,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      headers: {
                                        'Connection': 'keep-alive',
                                      },
                                      '${serverURL}/pic/${currentUser['id']}/profilePic.png',
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.contain,
                                    )),
                              ),
                            ),
                            SizedBox(height: 30),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                // width: 56 * fem,
                                height: 30 * fem,
                                child: Text(
                                  'NAME',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                // width: 35 * fem,
                                height: 50 * fem,
                                child: Text(
                                  currentUser['name'],
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                // width: 34 * fem,
                                height: 30 * fem,
                                child: Text(
                                  'BIO',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                // width: 54 * fem,
                                height: 50 * fem,
                                child: Text(
                                  currentUser['bio'],
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                // width: 146 * fem,
                                height: 30 * fem,
                                child: Text(
                                  'AGE',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                // width: 69 * fem,
                                height: 50 * fem,
                                child: Text(
                                  currentUser['age'].toString(),
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      // width: 100 * fem,
                                      height: 30 * fem,
                                      child: Text(
                                        'LOCATION\n',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 20 * ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.26 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      // width: 88 * fem,
                                      height: 50 * fem,
                                      child: Text(
                                        currentUser['location'],
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.26 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  // emailinputdTB (405:259)
                                  margin: EdgeInsets.fromLTRB(
                                      90 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: TextButton(
                                      onPressed: () {
                                        showDialog(
                                          barrierDismissible: true,
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            content: SizedBox(
                                              height: 250,
                                              width: 200,
                                              child: Column(
                                                children: [
                                                  Text(
                                                      'Please submit new location:',
                                                      style: SafeGoogleFont(
                                                        'Plus Jakarta Sans',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            Color(0xff000000),
                                                      )),
                                                  SizedBox(height: 30),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        1 * fem,
                                                        0 * fem,
                                                        3 * fem,
                                                        33 * fem),
                                                    width: double.infinity,
                                                    // height: 20,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10 * fem),
                                                      color: Color(0xfff4f3f3),
                                                    ),
                                                    child: TypeAheadField(
                                                      controller:
                                                          _locationController,
                                                      suggestionsCallback:
                                                          (pattern) async {
                                                        if (pattern.isEmpty) {
                                                          // Return all countries if the pattern is empty
                                                          return countries;
                                                        } else {
                                                          // Filter countries based on the pattern
                                                          return countries
                                                              .where((country) => country
                                                                  .toLowerCase()
                                                                  .contains(pattern
                                                                      .toLowerCase()))
                                                              .toList();
                                                        }
                                                      },
                                                      itemBuilder: (context,
                                                          String suggestion) {
                                                        return ListTile(
                                                          title:
                                                              Text(suggestion),
                                                        );
                                                      },
                                                      onSelected:
                                                          (String value) {
                                                        _locationController
                                                            .text = value;
                                                      },
                                                      builder: (context,
                                                          TextEditingController
                                                              controller,
                                                          FocusNode focusNode) {
                                                        return TextField(
                                                          controller:
                                                              controller,
                                                          focusNode: focusNode,
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .fromLTRB(
                                                              21.53 * fem,
                                                              15 * fem,
                                                              21.53 * fem,
                                                              17 * fem,
                                                            ),
                                                            hintText:
                                                                'Location',
                                                            hintStyle: TextStyle(
                                                                color: Color(
                                                                    0xffa4a4a4)),
                                                          ),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            fontSize: 19 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.26 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 71, 71, 71),
                                                    ),
                                                    onPressed: () {
                                                      print('SUBMIT!!!');
                                                      print('SUBMIT!!!');
                                                      submitLocation();
                                                      Navigator.of(context)
                                                          .pop(); // Close the dialog
                                                    },
                                                    child: Text('Submit',
                                                        style: SafeGoogleFont(
                                                          'Plus Jakarta Sans',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      child: Text('✍🏻')),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Container(
                              // signinbuttonJiZ (403:31)
                              margin: EdgeInsets.fromLTRB(
                                  1 * fem, 0 * fem, 0.47 * fem, 0 * fem),
                              child: TextButton(
                                onPressed: () {
                                  logout();
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 71 * fem,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 124, 0, 0),
                                    borderRadius:
                                        BorderRadius.circular(20 * fem),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Logout',
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
                      )
                    ]),
                  ),
                ),
        ),
      ),
    );
  }
}
