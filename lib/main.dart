import 'package:flutter/material.dart';
import 'package:qr_code/core/utils/assets_app.dart';
import 'package:qr_code/core/widgets/custom_button.dart';
import 'package:qr_code/features/scan_qr_code/view/pick_qr_code_view.dart';
import 'package:qr_code/features/splash/splash.dart';

import 'features/generate_qr/view/generate_qr_view.dart';
import 'features/scan_qr_code/view/qr_code_scanner_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo),
              const SizedBox(height: 50),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GenerateQRCode(),
                    ),
                  );
                },
                title: "Generate QR Code",
              ),
              const SizedBox(height: 25),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QRCodeScannerView(),
                    ),
                  );
                },
                title: "Scan QR Code",
              ),
              const SizedBox(height: 25),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PickQrCodeView(),
                    ),
                  );
                },
                title: "Pick QR Code",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
