import 'package:coba1/assets/color/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/model/home/get_date/list_data.dart';

class DialogHelper {
  static void showEditPriceDialog(BuildContext context, Product product) {
    double newPrice =
        product.price; // Inisialisasi harga baru dengan harga saat ini

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          insetPadding: const EdgeInsets.all(10),
          child: Container(
            width: 500,
            height: 220,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ubah Harga',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        'asset/image/CloseCircleFilled.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    labelText: 'Harga Baru',
                  ),
                  onChanged: (value) {
                    newPrice = double.tryParse(value) ?? product.price;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        backgroundColor: AppColors.primary500,
                      ),
                      onPressed: () {
                        // Implement logic to update price
                        // Provider.of<HomeViewModel>(context, listen: false).updatePrice(product, newPrice);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Terapkan Harga',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.neutral01,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
