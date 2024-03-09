import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code/core/widgets/qr_code_data_view.dart';
import 'package:scan/scan.dart';

class PickQrCodeView extends StatefulWidget {
  const PickQrCodeView({super.key});

  @override
  State<PickQrCodeView> createState() => _PickQrCodeViewState();
}

class _PickQrCodeViewState extends State<PickQrCodeView> {
  File? _image;
  String? res;

  Future<void> pickImage() async {
    await Permission.storage.request();
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      scan(pickedFile);
    }
  }

  scan(XFile pickedFile) async {
    String? str = await Scan.parse(pickedFile.path);
    setState(() {
      res = str;
    });
  }

  @override
  void initState() {
    pickImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Qr Code"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () async => pickImage(),
              icon: const Icon(Icons.image),
              label: const Text("Pick a qr code from gallery"),
            ),
            const SizedBox(height: 25),
            (_image != null)
                ? Image.file(_image!)
                : InkWell(
                    onTap: () async => await pickImage(),
                    child: Container(
                      height: 250,
                      width: 300,
                      color: Colors.grey.shade400,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 100,
                              color: Colors.grey.shade800,
                            ),
                            const SizedBox(height: 10),
                            const Text("Upload Your Qr Code"),
                          ],
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 25),
            (res != null)
                ? QrCodeDataView(res: res!)
                : const Text(
                    "This image isn't clear enough please pick anther",
                    style: TextStyle(
                      color: Color(0xff6e42bf),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
