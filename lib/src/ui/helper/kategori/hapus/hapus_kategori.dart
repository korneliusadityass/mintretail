import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/ui/helper/kategori/hapus/hapus_failed.dart';
import 'package:coba1/src/ui/helper/kategori/hapus/hapus_success.dart';
import 'package:flutter/material.dart';

class DeleteCategoryDialog extends StatelessWidget {
  final String categoryName;
  final VoidCallback onDelete;

  const DeleteCategoryDialog({
    super.key,
    required this.categoryName,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        color: AppColors.neutral01,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'asset/image/hapus_kategori.png',
              height: 135,
              width: 202,
            ),
            const SizedBox(height: 20),
            Text(
              'Hapus kategori "$categoryName"?',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            const Text(
              textAlign: TextAlign.center,
              'Kategori dan produk di dalamnya akan dihapus dari Daftar Kategori. Kamu tidak dapat mengembalikan Kategori yang telah dihapus',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.neutral08,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(125, 35),
                    backgroundColor: AppColors.primary500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Batal',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.neutral01,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    try {
                      onDelete();
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const DeleteSuccessDialog(
                            message: 'Kategori Berhasil di Hapus',
                          );
                        },
                      );
                    } catch (e) {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const DeleteFailedDialog(
                            message: 'Ups, Kategori Gagal di Hapus',
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(125, 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: AppColors.danger05)),
                  ),
                  child: const Text(
                    'Hapus',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.danger05,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
