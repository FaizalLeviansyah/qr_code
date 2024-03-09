import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  Uri uri = Uri.parse(url);
  if (!uri.isAbsolute) {
    uri = Uri.parse('https://$url');
  }
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

// Function to copy text to clipboard
void copyToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
}
