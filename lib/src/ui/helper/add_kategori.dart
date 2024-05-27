import 'package:coba1/assets/color/app_colors.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static void showAddCategoryDialog(BuildContext context) {
    String newCategoryName = '';
    bool isButtonEnabled = false;

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
            height: 210,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tambah Kategori'),
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
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    hintText: 'Rp.',
                  ),
                  onChanged: (value) {
                    newCategoryName = value;
                    isButtonEnabled = value.isNotEmpty;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(156, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: isButtonEnabled
                            ? AppColors.primary500
                            : AppColors.neutral03,
                      ),
                      onPressed: isButtonEnabled
                          ? () {
                              // Implement logic to add new category
                              // Example: viewModel.addCategory(newCategoryName);
                              Navigator.pop(context);
                            }
                          : null,
                      child: const Text(
                        'Tambahkan',
                        style: TextStyle(
                          fontSize: 12,
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
