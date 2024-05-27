import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/routeing/route.dart';
import 'package:coba1/src/ui/helper/dividerpainter.dart';
import 'package:coba1/src/ui/helper/tambah_diskon_co.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/model/home/get_date/list_data.dart';
import '../../core/viewmodel/checkout/checkout_vm.dart';

class CheckoutPage extends StatelessWidget {
  final List<Product> selectedProducts;

  const CheckoutPage({super.key, required this.selectedProducts});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckoutViewModel(
          subtotal: 0, totalDiscount: 0, totalPrice: 0, totalItems: 0)
        ..setProducts(selectedProducts),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Checkout',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Ringkasan Produk',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Consumer<CheckoutViewModel>(
                builder: (context, viewModel, _) {
                  return ListView.builder(
                    itemCount: viewModel.products.length,
                    itemBuilder: (context, index) {
                      final product = viewModel.products[index];
                      return ListTile(
                        title: Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${product.price.toString()}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        viewModel.decreaseQuantity(product);
                                      },
                                      icon: Image.asset(
                                        'asset/image/mines.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                    Text(
                                      ' ${product.quantity}',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        viewModel.increaseQuantity(product);
                                      },
                                      icon: Image.asset(
                                        'asset/image/plus.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'ini keterangan PPN',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.danger04),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Jumlah Stok: ${product.stock}',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Action to edit note
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(110, 25),
                                      backgroundColor: AppColors.primary500,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage('asset/image/edit.png'),
                                          size: 14,
                                          color: AppColors.neutral01,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Catatan',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.neutral01,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const DiskonDialog(),
                                    );
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 12,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Tambah Diskon',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ringkasan Pembayaran',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Consumer<CheckoutViewModel>(
                      builder: (context, viewModel, _) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Jumlah Item',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  '${viewModel.totalItems}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Subtotal Produk',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  '\$${viewModel.subtotal.toStringAsFixed(2)}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Diskon Produk',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  '\$${viewModel.totalDiscount.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const DividerPainter(),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Pembayaran',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  '\$${viewModel.totalPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(350, 40),
                          backgroundColor: AppColors.primary500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.payment,
                          );
                        },
                        child: const Text(
                          'Lanjutkan',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.neutral01,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
