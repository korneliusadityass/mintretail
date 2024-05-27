import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/ui/helper/payment_ringkasan.dart';
import 'package:flutter/material.dart';

import '../../core/viewmodel/payment/payment_vm.dart';

class PaymentSummarySheet extends StatelessWidget {
  final PaymentViewModel viewModel;

  const PaymentSummarySheet(
      {super.key, required this.viewModel, required double totalPayment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Detail Pembayaran',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Harga'),
              Text(
                  'ini total harga'), //${viewModel.subtotal.toStringAsFixed(2)}
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Diskon'),
              Text(
                  'ini total diskon'), //\$${viewModel.totalDiscount.toStringAsFixed(2)}
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal'),
              Text('ini subtotal'), //\$${viewModel.subtotal.toStringAsFixed(2)}
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Pembayaran',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Text(
                'ini total pembayaran', //\$${viewModel.totalPrice.toStringAsFixed(2)}
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(156, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: AppColors.primary500,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // Close the summary modal
                },
                child: const Text(
                  'Batalkan',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary500),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(
                    156,
                    45,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: AppColors.primary500,
                ),
                onPressed: () {
                  Navigator.pop(context); // Close the summary modal
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return PaymentInputSheet(viewModel: viewModel);
                    },
                  );
                },
                child: const Text(
                  'Konfirmasi',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.neutral01,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
