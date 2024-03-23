import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Sign_up_memo extends StatefulWidget {
  const Sign_up_memo({super.key});

  @override
  State<Sign_up_memo> createState() => _Sign_up_memoState();
}

class _Sign_up_memoState extends State<Sign_up_memo> {
  var memoNum;
  List<Map<String, dynamic>> memos = [
    {
      'text':
          '<b>Auto-Match</b> is an innovative platform that utilizes cutting-edge <b>AI</b> algorithms to connect you with like-minded individuals based on your <b>preferences</b>. </br></br> Get ready to embark on a journey of meaningful <b>connections</b> and exciting discoveries!',
      'imagePath': 'assets/page-1/images/welcome.png',
      'nextPage': '/sign_up_memo',
      'title': 'Welcome!'
    },
    {
      'text':
          'In this step, you\'ll provide basic information to create your Auto-Match <b>profile</b>. </br></br> You\'ll need your <b>email and a password</b> to set up your account securely.',
      'imagePath': 'assets/page-1/images/sign_up_info.png',
      'nextPage': '/sign_up_info',
      'title': 'Info'
    },
    {
      'text':
          'To enhance your Auto-Match experience, we\'ll fetch your <b>liked TikToks</b>. </br></br> Please ensure you have an active TikTok account and have <b>liked some videos</b>. </br></br>Make sure to also configure the <b>privacy settings</b> of your liked videos to public temporarily to enable data fetching.',
      'imagePath': 'assets/page-1/images/sign_up_reels.png',
      'nextPage': '/sign_up_reels',
      'title': 'Reels'
    },
    {
      'text':
          'Share your <b>musical taste</b> by submitting a URL of a <b>Spotify playlist</b> containing your favorite songs. </br></br> If your playlist is on another platform, use <a href="https://www.TuneMyMusic.com/">TuneMyMusic.com</a> to convert it to Spotify format for seamless integration with Auto-Match.',
      'imagePath': 'assets/page-1/images/sign_up_songs.png',
      'nextPage': '/sign_up_songs',
      'title': 'Songs'
    },
    {
      'text':
          'Customize your matching preferences by assigning <b>weights</b> to different qualities.</br></br> These weights will be used to calculate personalized scores for other users, ensuring that your matches align with your <b>priorities</b>.</br> Higher weights indicate greater importance.',
      'imagePath': 'assets/page-1/images/sign_up_filters.png',
      'nextPage': '/sign_up_filters',
      'title': 'Set Preferences'
    },
    {
      'text':
          'Upload a clear <b>picture</b> of your face to help other users interested in you find you easily. </br></br> A clear photo can spark connections and open doors to exciting possibilities.',
      'imagePath': 'assets/page-1/images/sign_up_pic.png',
      'nextPage': '/sign_up_pic',
      'title': 'Profile pic'
    },
    {
      'text':
          'Train our <b>AI</b> model to understand your preferences! </br></br> Select faces you find <b>attractive</b> from a pool of options.</br> Your choices will help refine our matching algorithm to suggest people who <b>align</b> with your taste.',
      'imagePath': 'assets/page-1/images/sign_up_face_training.png',
      'nextPage': '/sign_up_face_training',
      'title': 'Face AI training'
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadPage();
  }

  Future<void> loadPage() async {
    final argObject = ModalRoute.of(context)!.settings.arguments as dynamic;
    final memoNumArg = argObject['memoNum'];
    setState(() {
      memoNum = memoNumArg;
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.fromLTRB(13 * fem, 33 * fem, 12 * fem, 26 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      13 * fem, 0 * fem, 67 * fem, 16 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 18 * fem, 1 * fem),
                        width: 51 * fem,
                        height: 50 * fem,
                        child: Image.asset(
                          'assets/page-1/images/logo-JpD.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        memos[memoNum]['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32 * ffem,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  memos[memoNum]['imagePath'],
                  fit: BoxFit.cover,
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 53 * fem),
                  child: Html(
                    data: memos[memoNum]['text'],
                    style: {
                      'body': Style(
                        fontSize: FontSize(24 * ffem),
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff2c2c2c),
                      ),
                    },
                    onLinkTap: (url, _, __) {
                      launchUrl(Uri.parse(url!), mode: LaunchMode.externalApplication);
                    },
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(28 * fem, 0 * fem, 32 * fem, 0 * fem),
                  child: TextButton(
                    onPressed: () {
                      if (memos[memoNum]['nextPage'] == '/sign_up_memo') {
                        Navigator.pushNamed(context, '/sign_up_memo',
                            arguments: {'memoNum': 1});
                      } else if (memos[memoNum]['nextPage'] ==
                          '/sign_up_face_training') {
                        Navigator.pushNamed(context, '/sign_up_face_training',
                            arguments: {'pageNum': 1, 'lastPageNum': 3});
                      } else {
                        Navigator.pushNamed(context, memos[memoNum]['nextPage'],
                            arguments: {'pop': false});
                      }
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
                          'Continue',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24 * ffem,
                            fontWeight: FontWeight.w500,
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
        ),
      ),
    );
  }
}
