import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/model/home/get_date/list_data.dart';
import 'package:coba1/src/core/viewmodel/home/home_vm.dart';
import 'package:coba1/src/ui/helper/ubah_harga_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required List<Product> products});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: viewModel.cartItems.length,
      itemBuilder: (context, index) {
        final product = viewModel.cartItems[index];
        return SizedBox(
          width: 102,
          height: 175,
          child: Card(
            color: AppColors.neutral01,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Menampilkan gambar produk di bagian atas card
                    SizedBox(
                      width: 102,
                      height: 85,
                      child: Image.asset(
                        'asset/image/produk1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Menempatkan nama produk di posisi yang tetap di bagian atas card
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            'Rp. ${product.price}',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            DialogHelper.showEditPriceDialog(context, product);
                          },
                          icon: Image.asset(
                            'asset/image/ubah_harga.png',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 8,
                  left: 4,
                  right: 4,
                  child: product.quantity == 0
                      ? ElevatedButton(
                          onPressed: () {
                            viewModel.increaseQuantity(product);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: AppColors.primary500,
                          ),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
