import 'package:flutter/material.dart';

class DiskonDialog extends StatefulWidget {
  const DiskonDialog({super.key});

  @override
  _DiskonDialogState createState() => _DiskonDialogState();
}

class _DiskonDialogState extends State<DiskonDialog> {
  String _selectedDiskon = 'Persen';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedDiskon,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDiskon = newValue ??
                      'Persen'; 
                });
              },
              items: <String>['Persen', 'Rp']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Jumlah Diskon',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika ketika tombol Terapkan ditekan
              },
              child: const Text('Terapkan'),
            ),
          ],
        ),
      ),
    );
  }
}
