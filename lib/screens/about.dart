import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class ScreenAbout extends StatefulWidget {
  const ScreenAbout({Key? key}) : super(key: key);
  @override
  State<ScreenAbout> createState() => _ScreenAboutState();
}

class _ScreenAboutState extends State<ScreenAbout> {
  final _size = 30.0;

  @override
  void initState() {
    super.initState();
    ToastContext().init(context);
  }

  void _loadUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      if (kDebugMode) print("Cannot Open $url");
    }
  }

  void _onWebsite() => _loadUrl("http://kabulahillsdachurch.com");

  void _onFacebook() =>
      _loadUrl("https://www.facebook.com/kabulahillsdachurch");

  void _onCopy() async {
    await Clipboard.setData(const ClipboardData(
        text:
            "https://drive.google.com/drive/folders/1v7uamwFGZBhUKGAWHYAZptJBEeCKcOX8?usp=share_link"));
    Toast.show("Copied Link to Resources",
        duration: Toast.lengthShort, gravity: Toast.bottom);
  }

  void _onAPK() => _loadUrl(
      "https://drive.google.com/drive/folders/1v7uamwFGZBhUKGAWHYAZptJBEeCKcOX8?usp=share_link");

  void _onWindows() => _loadUrl(
      "https://drive.google.com/drive/folders/1v7uamwFGZBhUKGAWHYAZptJBEeCKcOX8?usp=share_link");

  void _onPDF() => _loadUrl(
      "https://drive.google.com/drive/folders/1v7uamwFGZBhUKGAWHYAZptJBEeCKcOX8?usp=share_link");

  void _onShare() => Share.share(
      'Hey Be Blessed with Kabula Choruses\nhttps://play.google.com/store/apps/details?id=com.m2kdevelopments.kabulachoruses',
      subject: 'Kabula Choruses');

  void _onPlayStore() {}

  void _onGooglePlayStore() => _loadUrl(
      "https://play.google.com/store/apps/details?id=com.m2kdevelopments.kabulachoruses");

  void _onSubmitChorus() => _loadUrl("https://docs.google.com/forms/d/e/1FAIpQLSesS07FLzK69pBCwBhLRbxSDuKzxEoYHeYf2icOVPz6w4hIVg/viewform");

  @override
  Widget build(BuildContext context) {
    var btnStyle = ButtonStyle(
      elevation: MaterialStateProperty.all<double>(10.0),
      shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 255, 255, 255)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
              color: Color.fromARGB(255, 254, 244, 255), width: 2.0),
        ),
      ),
    );

    var textStyle = const TextStyle(
      color: Color.fromARGB(255, 137, 122, 140),
      fontSize: 19,
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 250,
                height: 250,
              ),
              Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: btnStyle,
                          onPressed: _onWebsite,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.public,
                                color: Colors.orange,
                              ),
                              Text(
                                "KHC Wesbite",
                                style: textStyle,
                              )
                            ],
                          )),
                      ElevatedButton(
                          style: btnStyle,
                          onPressed: _onFacebook,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.facebook,
                                color: Colors.blue,
                              ),
                              Text(
                                "KHC Facebook Page",
                                style: textStyle,
                              )
                            ],
                          )),
                      ElevatedButton(
                          style: btnStyle,
                          onPressed: _onShare,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.share,
                                color: Colors.green,
                              ),
                              Text(
                                "Share The App",
                                style: textStyle,
                              )
                            ],
                          )),
                      ElevatedButton(
                          style: btnStyle,
                          onPressed: _onCopy,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.copy,
                                color: Colors.red,
                              ),
                              Text(
                                "Copy Link to Downloads",
                                style: textStyle,
                              )
                            ],
                          )),
                      ElevatedButton(
                          style: btnStyle,
                          onPressed: _onSubmitChorus,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.music_note_sharp,
                                color: Colors.purple,
                              ),
                              Text(
                                "Submit New Chorus",
                                style: textStyle,
                              )
                            ],
                          )),
                      const Divider(),
                      const Text("Downloads"),
                      ElevatedButton(
                          style: btnStyle,
                          onPressed: _onAPK,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.android,
                                color: Colors.green,
                              ),
                              Text(
                                "Android APK",
                                style: textStyle,
                              )
                            ],
                          )),
                      ElevatedButton(
                          style: btnStyle,
                          onPressed: _onWindows,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/windows.png',
                                width: _size,
                                height: _size,
                              ),
                              Text(
                                "Windows PC",
                                style: textStyle,
                              )
                            ],
                          )),
                      ElevatedButton(
                          style: btnStyle,
                          onPressed: _onPDF,
                          child: Row(
                            children: [
                              // Image.asset(
                              //   'assets/pdf.png',
                              //   width: _size,
                              //   height: _size,
                              // ),
                              const Icon(
                                Icons.picture_as_pdf,
                                color: Colors.red,
                              ),
                              Text(
                                "PDF Document",
                                style: textStyle,
                              )
                            ],
                          )),
                      ElevatedButton(
                          style: btnStyle,
                          onPressed: _onGooglePlayStore,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/googleplay.png',
                                width: _size,
                                height: _size,
                              ),
                              Text(
                                "Google Play",
                                style: textStyle,
                              )
                            ],
                          )),
                      ElevatedButton(
                          style: btnStyle,
                          onPressed: _onPlayStore,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/ios.png',
                                width: _size,
                                height: _size,
                              ),
                              Text(
                                "Coming Soon...",
                                style: textStyle,
                              )
                            ],
                          )),
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
