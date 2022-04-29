import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:school/utils/colors.dart';
import 'package:sizer/sizer.dart';

class QRVIewScreen extends StatefulWidget {
  const QRVIewScreen({Key? key}) : super(key: key);

  @override
  State<QRVIewScreen> createState() => _QRVIewScreenState();
}

class _QRVIewScreenState extends State<QRVIewScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  onQRCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: onQRCreated,
        overlay: QrScannerOverlayShape(
          borderColor: primaryColor,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: 80.w
        ),
      ),
    );
  }
}
