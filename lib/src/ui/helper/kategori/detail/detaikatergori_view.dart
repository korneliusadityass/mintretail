import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/viewmodel/add_produk/add_produk_vm.dart';
import 'package:coba1/src/core/viewmodel/kategori/detail/detailkategori_vm.dart';
import 'package:coba1/src/ui/add_produk/add_produk_view.dart';
import 'package:coba1/src/ui/helper/kategori/detail/popup/delete_detail.dart';
import 'package:coba1/src/ui/helper/kategori/detail/popup/edit_detail.dart';
import 'package:coba1/src/ui/helper/kategori/detail/riwayatstok.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KategoriProductDetailsPage extends StatelessWidget {
  const KategoriProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Cari Produk',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: AppColors.primary500),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: Image.asset(
                      'asset/image/Box_Product.png',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (context) => AddProductViewModel(),
                            child: const AddProductScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Consumer<ProductViewModel>(
                  builder: (context, viewModel, child) {
                    return ListView.builder(
                      itemCount: viewModel.products.length,
                      itemBuilder: (context, index) {
                        final product = viewModel.products[index];
                        return Padding(
                          padding: const EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StockHistoryScreen(
                                    productId: product.id,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              color: AppColors.neutral01,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.asset(
                                          'asset/image/produk1.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                product.name,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                    icon: Image.asset(
                                                        'asset/image/edit_ktgry.png'),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditProductScreen(
                                                            product: product,
                                                            onEdit:
                                                                (updatedProduct) {
                                                              viewModel
                                                                  .updateProduct(
                                                                      product
                                                                          .id,
                                                                      updatedProduct);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: Image.asset(
                                                        'asset/image/trash.png'),
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            DeleteProductDialog(
                                                          productName:
                                                              product.name,
                                                          onDelete: () {
                                                            viewModel
                                                                .deleteProduct(
                                                                    product.id);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Rp. ${product.price.toStringAsFixed(2)}', // Formatting price
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          const SizedBox(height: 8),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                              decoration: BoxDecoration(
                                                color: AppColors.primary500,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                'Stok: ${product.stock}',
                                                style: const TextStyle(
                                                  fontSize: 9,
                                                  color: AppColors.neutral01,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                        ],
                                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
