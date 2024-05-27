import 'package:coba1/assets/color/app_colors.dart';
import 'package:flutter/material.dart';

class FilterPopup extends StatefulWidget {
  const FilterPopup({super.key});

  @override
  _FilterPopupState createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  bool get _isButtonEnabled =>
      _startDateController.text.isNotEmpty &&
      _endDateController.text.isNotEmpty;

  String? _selectedCategory;
  final List<String> _categories = [
    'transaksi 1',
    'transaksi 2',
    'transaksi 3'
  ];

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != controller.text) {
      setState(() {
        controller.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Filter Data',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 160, // Set your desired width here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dari',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _startDateController,
                      decoration: InputDecoration(
                        labelText: 'Tanggal Awal',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _selectDate(_startDateController);
                          },
                          child: Image.asset(
                            'asset/image/solar_calendar-bold.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 160, // Set your desired width here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sampai',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _endDateController,
                      decoration: InputDecoration(
                        labelText: 'Tanggal Akhir',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _selectDate(_endDateController);
                          },
                          child: Image.asset(
                            'asset/image/solar_calendar-bold.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _selectedCategory == category
                          ? AppColors.primary500
                          : Colors.grey[200],
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedCategory == category
                            ? AppColors.neutral01
                            : AppColors.neutral09,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isButtonEnabled
                ? () {
                    Navigator.pop(context);
                  }
                : null,
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(328, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            child: const Text('Terapkan'),
          ),
        ],
      ),
    );
  }
}
