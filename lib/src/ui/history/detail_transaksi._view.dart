import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/model/history/history_model.dart';
import 'package:coba1/src/core/viewmodel/history/history/detail_vm.dart';
import 'package:coba1/src/ui/helper/dividerpainter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionDetailPage extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransactionDetailViewModel(transaction),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detail Pembayaran',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.neutral08,
            ),
          ),
        ),
        body: Consumer<TransactionDetailViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 21, right: 21),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Image.asset(
                                viewModel.transaction.status ==
                                        TransactionStatus.success
                                    ? 'asset/image/trans_success.png'
                                    : viewModel.transaction.status ==
                                            TransactionStatus.failed
                                        ? 'asset/image/trans_failed.png'
                                        : 'asset/image/trans_cancel.png',
                                width: 90,
                                height: 93.27,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Center(
                              child: Text(
                                'Transaksi ${viewModel.getStatusText()}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            buildDetailRow(
                                'Nomor Transaksi', viewModel.transaction.id),
                            const SizedBox(height: 6),
                            buildDetailRow(
                                'Tipe Transaksi', viewModel.transaction.type),
                            const SizedBox(height: 6),
                            buildDetailRow('Waktu Transaksi',
                                '${viewModel.transaction.date} ${viewModel.transaction.time}'),
                            const SizedBox(height: 6),
                            buildDetailRow('Provider Ref',
                                viewModel.transaction.providerRef),
                            const SizedBox(height: 6),
                            buildDetailRow('Metode Pembayaran',
                                viewModel.transaction.paymentMethod),
                            const SizedBox(height: 6),
                            buildDetailRow('Nama Merchant',
                                viewModel.transaction.merchantName),
                            const SizedBox(height: 6),
                            buildDetailRow('Kode Produk',
                                viewModel.transaction.productCode),
                            const SizedBox(height: 6),
                            buildDetailRow('Nama Produk',
                                viewModel.transaction.productName),
                            const SizedBox(height: 6),
                            buildDetailRow('Customer Name',
                                viewModel.transaction.customerName),
                            const SizedBox(height: 6),
                            buildDetailRow('SN', viewModel.transaction.sn),
                            const SizedBox(height: 6),
                            buildDetailRow('Customer ID',
                                viewModel.transaction.customerId),
                            const SizedBox(height: 6),
                            const DividerPainter(),
                            buildDetailRow('Nominal Voucher',
                                '\$${viewModel.transaction.voucherAmount}'),
                            const SizedBox(height: 6),
                            buildDetailRow('Biaya Voucher',
                                '\$${viewModel.transaction.voucherFee}'),
                            const SizedBox(height: 6),
                            buildDetailRow('Diskon',
                                '\$${viewModel.transaction.discount}'),
                            const SizedBox(height: 6),
                            buildDetailRow(
                                'Total', '\$${viewModel.transaction.total}',
                                isBold: true),
                            const SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(156, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            side: const BorderSide(
                              color: AppColors.primary500,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          // Logika unduh transaksi
                        },
                        icon: Image.asset(
                          'asset/image/download.png',
                          width: 20,
                          height: 20,
                        ),
                        label: const Text(
                          'Download',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary500,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(156, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            side: const BorderSide(
                              color: AppColors.primary500,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          // Logika bagikan transaksi
                        },
                        icon: Image.asset(
                          'asset/image/share_linear.png',
                          width: 20,
                          height: 20,
                        ),
                        label: const Text(
                          'Share',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
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
          Text(label, style: const TextStyle(fontSize: 14)),
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
}
