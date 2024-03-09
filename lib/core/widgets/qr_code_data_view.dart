import 'package:flutter/material.dart';
import 'package:qr_code/core/function/functions.dart';
import 'package:qr_code/core/widgets/custom_snack_bar.dart';

class QrCodeDataView extends StatelessWidget {
  const QrCodeDataView({super.key, required this.res});

  final String res;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Qr code: $res',
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff6e42bf),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                try {
                  launchURL(res);
                } catch (e) {
                  customSnackBar(
                    context: context,
                    text: "Error launching URL",
                  );
                }
              },
              child: const Text("Launch Browser"),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  copyToClipboard(res);
                  customSnackBar(
                    context: context,
                    text: "Copied to clipboard",
                  );
                } catch (e) {
                  customSnackBar(
                    context: context,
                    text: "Error Coping to clipboard",
                  );
                }
              },
              child: const Text("Copy To Clipboard"),
            )
          ],
        ),
      ],
    );
  }
}
