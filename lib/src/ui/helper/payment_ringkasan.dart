import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/ui/payment/payment_result_view.dart';
import 'package:flutter/material.dart';

import '../../core/viewmodel/payment/payment_vm.dart';

class PaymentInputSheet extends StatefulWidget {
  final PaymentViewModel viewModel;

  const PaymentInputSheet({super.key, required this.viewModel});

  @override
  _PaymentInputSheetState createState() => _PaymentInputSheetState();
}

class _PaymentInputSheetState extends State<PaymentInputSheet> {
  final TextEditingController _controller = TextEditingController();
  int? selectedAmount;
  final List<int> amounts = [20000, 50000, 100000];
  final String exactAmountLabel = 'Uang Pas';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        // Update the state when the text field value changes
        selectedAmount = null;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Jumlah Dibayarkan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                selectedAmount =
                    null; // Clear selected amount if manually entering value
              });
            },
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.center, // Center align the chips
            children: [
              SizedBox(
                width: 156,
                height: 43,
                child: Center(
                  child: ChoiceChip(
                    label: Text(
                      exactAmountLabel,
                    ),
                    selected:
                        selectedAmount == widget.viewModel.totalAmount.toInt(),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _controller.text = widget.viewModel.totalAmount
                              .toStringAsFixed(
                                  0); // Set text field to total amount
                          selectedAmount = widget.viewModel.totalAmount.toInt();
                        } else {
                          _controller.clear();
                          selectedAmount = null;
                        }
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 156,
                height: 43,
                child: Center(
                  child: ChoiceChip(
                    label: Text('Rp${amounts[0].toStringAsFixed(0)}'),
                    selected: selectedAmount == amounts[0],
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _controller.text = amounts[0].toString();
                          selectedAmount = amounts[0];
                        } else {
                          _controller.clear();
                          selectedAmount = null;
                        }
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 156,
                height: 43,
                child: Center(
                  child: ChoiceChip(
                    label: Text('Rp${amounts[1].toStringAsFixed(0)}'),
                    selected: selectedAmount == amounts[1],
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _controller.text = amounts[1].toString();
                          selectedAmount = amounts[1];
                        } else {
                          _controller.clear();
                          selectedAmount = null;
                        }
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 156,
                height: 43,
                child: Center(
                  child: ChoiceChip(
                    label: Text('Rp${amounts[2].toStringAsFixed(0)}'),
                    selected: selectedAmount == amounts[2],
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _controller.text = amounts[2].toString();
                          selectedAmount = amounts[2];
                        } else {
                          _controller.clear();
                          selectedAmount = null;
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(328, 46),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: (_controller.text.isNotEmpty ||
                        selectedAmount != null)
                    ? AppColors.primary500
                    : AppColors
                        .neutral03, // Set the color based on the button state
              ),
              onPressed: (_controller.text.isNotEmpty || selectedAmount != null)
                  ? () {
                      // Implement the payment logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const PaymentResultPage(), // Navigate to PaymentResultPage
                        ),
                      );
                    }
                  : null,
              child: const Text(
                'Lanjutkan Pembayaran',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutral01,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
