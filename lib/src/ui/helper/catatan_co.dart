import 'package:flutter/material.dart';

class CatatanDialog extends StatefulWidget {
  const CatatanDialog({super.key});

  @override
  _CatatanDialogState createState() => _CatatanDialogState();
}

class _CatatanDialogState extends State<CatatanDialog> {
  final TextEditingController _catatanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tambah Catatan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _catatanController,
              decoration: const InputDecoration(
                labelText: 'Masukkan Catatan',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tampilkan catatan di popup
                final catatan = _catatanController.text;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Catatan'),
                    content: Text(catatan),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
