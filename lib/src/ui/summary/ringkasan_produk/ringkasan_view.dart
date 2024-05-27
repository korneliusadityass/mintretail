import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/viewmodel/history/summary/ringkasan_produk/ringkasan_vm.dart';
import 'package:coba1/src/ui/helper/filter_tgl.dart'; // Pastikan path sesuai dengan struktur proyek Anda
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BestSellingProductsPage extends StatefulWidget {
  const BestSellingProductsPage({super.key});

  @override
  _BestSellingProductsPageState createState() =>
      _BestSellingProductsPageState();
}

class _BestSellingProductsPageState extends State<BestSellingProductsPage> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ringkasan Produk Paling Laku',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.neutral08,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) =>
            BestSellingProductsViewModel()..fetchBestSellingProducts(),
        child: Consumer<BestSellingProductsViewModel>(
          builder: (context, viewModel, child) {
            double totalHeight = viewModel.products.length * 200;

            return Column(
              children: [
                _buildDateFilter(context, viewModel),
                Expanded(
                  child: Card(
                    color: AppColors.neutral03,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.all(19.0),
                    child: Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: SizedBox(
                        width: 328, // Set width of the container
                        height: 326, // Set height of the container
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: viewModel.products.length,
                          itemBuilder: (context, index) {
                            final product = viewModel.products[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.neutral08,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Total Harga',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '\$${product.totalPrice}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Total Item',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      '${product.totalItems}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const Divider(height: 20, thickness: 1),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  color: AppColors.neutral03,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.all(19.0),
                  child: Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: SizedBox(
                      width: 328, // Set width of the container
                      height: 70, // Set height of the container
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Grand Total',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '\$${viewModel.grandTotalPrice}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Jumlah Item',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '${viewModel.totalItems}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDateFilter(
      BuildContext context, BestSellingProductsViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          TextField(
            controller: _dateController,
            readOnly: true,
            decoration: const InputDecoration(
              hintText: 'Selected Date',
              contentPadding: EdgeInsets.all(16.0),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Image.asset(
                        'asset/image/mage_filter-fill.png'), // Sesuaikan path gambar sesuai dengan struktur proyek Anda
                    onPressed: () async {
                      final selectedDate = await showModalBottomSheet<DateTime>(
                        context: context,
                        builder: (context) {
                          return const FilterPopup();
                        },
                      );
                      if (selectedDate != null) {
                        setState(() {
                          _dateController.text =
                              selectedDate.toLocal().toString().split(' ')[0];
                        });
                      }
                    },
                  ),
                  const Text('Filter'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
