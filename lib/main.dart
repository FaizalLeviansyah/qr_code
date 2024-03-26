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
      title: 'Scan Boarding Access Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 58, 62, 183),
        ),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

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
      // bottomNavigationBar: BottomNavigationBar(
      //     type: BottomNavigationBarType.shifting,
      //     currentIndex: index,
      //     onTap: (x),
      //     {
      //       setState(() {
      //         index = x;
      //       });
      //     },
      //     elevation: 16.0,
      //     showUnselectedLabels: true,
      //     unselectedItemColor: Color.white54,
      //     selectedItemColor: Color.white,
      //     items: menuItemlist
      //         .map((MenuItem menuItem) => BottomNavigationBarItem(
      //             backgroundColor: colors[index]
      //               icon: Icon(menuItem.iconData),
      //               label: menuItem.text,
      //         ))
      //         .toList(),
      //     ),
      //     body: _buildBody[index]
    );
  }
}
