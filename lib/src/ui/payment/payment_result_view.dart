import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/viewmodel/payment/payment_result_vm.dart';
import 'package:coba1/src/ui/helper/dividerpainter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentResultPage extends StatelessWidget {
  const PaymentResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaymentResultViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transaksi(Berhasil/Gagal)'),
        ),
        body: Consumer<PaymentResultViewModel>(
          builder: (context, viewModel, child) {
            return ListView.builder(
              itemCount: viewModel.transactionList.length,
              itemBuilder: (context, index) {
                var transaction = viewModel.transactionList[index];

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 327, 
                    height: 628.27, 
                    child: Card(
                      color: AppColors.neutral01,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  transaction.status == 'success'
                                      ? 'asset/image/trans_success.png'
                                      : transaction.status == 'failure'
                                          ? 'asset/image/trans_failed.png'
                                          : 'asset/image/trans_cancel.png',
                                  width: 90,
                                  height: 93.27,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  transaction.status == 'success'
                                      ? 'Transaksi Sukses'
                                      : transaction.status == 'failure'
                                          ? 'Transaksi Gagal'
                                          : 'Transaksi Dibatalkan',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            buildDetailRow(
                              'Waktu Transaksi:',
                              '${transaction.transactionDate} ${transaction.transactionTime}',
                            ),
                            const SizedBox(height: 12),
                            buildDetailRow(
                              'Nomor Transaksi:',
                              transaction.transactionNumber,
                            ),
                            const SizedBox(height: 12),
                            buildDetailRow(
                              'Provider Ref:',
                              transaction.providerRef,
                            ),
                            const SizedBox(height: 12),
                            buildDetailRow(
                              'Tipe Transaksi:',
                              transaction.transactionType,
                            ),
                            const SizedBox(height: 12),
                            buildDetailRow(
                              'Metode Pembayaran:',
                              transaction.paymentMethod,
                            ),
                            const SizedBox(height: 12),
                            buildDetailRow(
                              'Issuer Type:',
                              transaction.issuerType,
                            ),
                            const SizedBox(height: 12),
                            const DividerPainter(),
                            const SizedBox(height: 12),
                            buildDetailRow(
                              'Jumlah Item:',
                              transaction.totalItems.toString(),
                            ),
                            const SizedBox(height: 12),
                            buildDetailRow(
                              'Subtotal Produk:',
                              '\$${transaction.subtotalProducts.toStringAsFixed(2)}',
                            ),
                            const SizedBox(height: 12),
                            buildDetailRow(
                              'Total Diskon:',
                              '\$${transaction.totalDiscount.toStringAsFixed(2)}',
                            ),
                            const SizedBox(height: 34),
                            buildTotalRow(
                              'Total:',
                              '\$${transaction.total.toStringAsFixed(2)}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(156, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(
                          color: AppColors.primary500,
                        ),
                      ),
                    ),
                    onPressed: () async {},
                    icon: Image.asset(
                      'asset/image/download.png',
                      width: 20,
                      height: 20,
                    ),
                    label: const Text('Download'),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(156, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(
                          color: AppColors.primary500,
                        ),
                      ),
                    ),
                    onPressed: () async {},
                    icon: Image.asset(
                      'asset/image/share_linear.png',
                      width: 20,
                      height: 20,
                    ),
                    label: const Text('Share'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(327, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: AppColors.primary500,
                ),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.neutral01,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTotalRow(String label, String value) {
    return Container(
      color: AppColors.primary100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
