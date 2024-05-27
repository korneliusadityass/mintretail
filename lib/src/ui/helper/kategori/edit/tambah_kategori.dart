import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/viewmodel/kategori/kategori_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TambahCategoryDialog extends StatefulWidget {
  const TambahCategoryDialog({super.key});

  @override
  _TambahCategoryDialogState createState() => _TambahCategoryDialogState();
}

class _TambahCategoryDialogState extends State<TambahCategoryDialog> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _isButtonDisabled = _controller.text.trim().isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tambah Kategori',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.neutral08,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('asset/image/CloseCircleFilled.png'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Masukkan nama kategori',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _isButtonDisabled
                      ? null
                      : () {
                          Provider.of<CategoryViewModel>(context, listen: false)
                              .addCategory(_controller.text.trim());
                          Navigator.of(context).pop();
                        },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return AppColors.neutral03;
                      }
                      return AppColors.primary500;
                    }),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Tambahkan',
                    style: TextStyle(color: AppColors.neutral01),
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
