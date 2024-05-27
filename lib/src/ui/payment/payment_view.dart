import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/model/payment/payment_model.dart';
import 'package:coba1/src/core/routeing/route.dart';
import 'package:coba1/src/ui/helper/payment_konfirm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodel/payment/payment_vm.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaymentViewModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Metode Pembayaran')),
        body: Consumer<PaymentViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Pilih Metode Pembayaran',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.paymentMethods.length,
                      itemBuilder: (context, index) {
                        final method = viewModel.paymentMethods[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: InkWell(
                            onTap: () {
                              viewModel.selectPaymentMethod(method.type);
                            },
                            child: Material(
                              type: MaterialType.transparency,
                              child: Card(
                                elevation: 0, // Menghilangkan bayangan
                                color: AppColors.neutral01,
                                shadowColor: Colors.transparent,
                                child: ListTile(
                                  leading: method.icon != null
                                      ? Image.asset(
                                          method.icon,
                                          width: 30,
                                          height: 30,
                                        )
                                      : null,
                                  title: Text(method.name),
                                  trailing: Radio<PaymentType>(
                                    value: method.type,
                                    groupValue: viewModel.selectedPaymentMethod,
                                    onChanged: (PaymentType? value) {
                                      viewModel.selectPaymentMethod(value);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tambahkan sedikit jarak vertikal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total Pembayaran',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '\$${viewModel.totalAmount.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(135, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor:
                                  viewModel.selectedPaymentMethod != null
                                      ? AppColors.primary500
                                      : AppColors.primary500.withOpacity(0.5),
                            ),
                            onPressed: viewModel.selectedPaymentMethod != null
                                ? () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return PaymentSummarySheet(
                                          viewModel: viewModel,
                                          totalPayment: 0,
                                        );
                                      },
                                    );
                                  }
                                : null,
                            child: const Text(
                              'Bayar',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.neutral01,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Routes.qris,
                              );
                            },
                            child: const Text('Qris'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
