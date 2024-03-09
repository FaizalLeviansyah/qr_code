import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code/core/widgets/qr_code_data_view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerView extends StatefulWidget {
  const QRCodeScannerView({super.key});

  @override
  State<QRCodeScannerView> createState() => _QRCodeScannerViewState();
}

class _QRCodeScannerViewState extends State<QRCodeScannerView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QR Code Scanner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
              ),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(20),
              child: (result != null)
                  ? QrCodeDataView(
                      res: result!.code!,
                    )
                  : const Text(
                      'Scan a code',
                      style: TextStyle(
                        color: Color(0xff6e42bf),
                        height: 2,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
