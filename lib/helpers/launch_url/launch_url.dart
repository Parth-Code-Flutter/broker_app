import 'package:url_launcher/url_launcher.dart';

class LaunchUrlHelper{
  static Future<void> launchUrlMethod(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}