import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/model/home/get_date/list_data.dart';
import 'package:coba1/src/core/viewmodel/home/home_vm.dart';
import 'package:coba1/src/ui/helper/ubah_harga_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key, required List<Product> products});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return ListView.builder(
      itemCount: viewModel.cartItems.length,
      itemBuilder: (context, index) {
        final product = viewModel.cartItems[index];
        return Padding(
          padding: const EdgeInsets.all(1),
          child: Card(
            color: AppColors.neutral01,
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menampilkan gambar produk di pojok kiri atas
                  Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1, // Menentukan rasio aspek gambar
                      child: Image.asset(
                        'asset/image/produk1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                      width:
                          16), // Memberi jarak antara gambar produk dan konten lainnya
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp. ${product.price}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            TextButton(
                              onPressed: () {
                                DialogHelper.showEditPriceDialog(
                                    context, product);
                              },
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.only(
                                  top: 2,
                                  right: 6,
                                  left: 6,
                                  bottom: 2,
                                ),
                                fixedSize: const Size(59, 18),
                                backgroundColor: AppColors.primary000,
                              ),
                              child: const Text(
                                'Ubah Harga',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            product.quantity == 0
                                ? ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(100, 18),
                                      backgroundColor: AppColors.primary500,
                                    ),
                                    onPressed: () {
                                      viewModel.increaseQuantity(product);
                                    },
                                    child: const Text(
                                      'Tambah',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: AppColors.neutral01,
                                      ),
                                    ),
                                  )
                                : Row(
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
                                        style: const TextStyle(fontSize: 16),
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
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Stok: ${product.stock}',
                            style: const TextStyle(fontSize: 9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
