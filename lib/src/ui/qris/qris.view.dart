import 'package:flutter/material.dart';

class QRISView extends StatelessWidget {
  const QRISView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QRIS',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            // width: 360,
            // height: 677,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/image/bg_qris.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
