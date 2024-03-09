import 'package:flutter/material.dart';
import 'package:qr_code/features/generate_qr/view/qr_image_view.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Generate QR Code'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) =>
                    (value!.isEmpty) ? 'This field cannot be empty' : null,
                controller: controller,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your URL',
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => QRImage(controller)),
                      ),
                    );
                  }
                },
                child: const Text('GENERATE QR CODE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
