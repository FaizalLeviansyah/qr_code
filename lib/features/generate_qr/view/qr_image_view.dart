import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_code/core/widgets/custom_snack_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class QRImage extends StatelessWidget {
  QRImage(this.controller, {super.key});

  final TextEditingController controller;
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR code'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: _screenshotController,
              child: Container(
                color: Colors.white,
                child: QrImageView(
                  data: controller.text,
                  size: 280,
                  embeddedImageStyle: const QrEmbeddedImageStyle(
                    size: Size(100, 100),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                try {
                  _captureAndSaveQRCode();
                  customSnackBar(
                    context: context,
                    text: "File Saved to Gallery",
                  );
                } catch (e) {
                  customSnackBar(
                    context: context,
                    text: "Save Error: $e",
                  );
                }
              },
              child: const Text('Download QR Code'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _captureAndSaveQRCode() async {
    final bytes = await _screenshotController.capture(
      delay: const Duration(milliseconds: 10),
    );
    await ImageGallerySaver.saveImage(
      bytes!,
      name: controller.text,
    );
  }
// _saved(Uint8List image) async {
//   try {
//     await ImageGallerySaver.saveImage(image);
//     debugPrint("File Saved to Gallery");
//   } catch (e) {
//     debugPrint("Save Error $e");
//   }
// }
}
