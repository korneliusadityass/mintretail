
import 'package:flutter/material.dart';

class StockHistory {
  final String date;
  final String adjustment;
  final String note;
  final String nominal;
  final String transactionNote;

  StockHistory({
    required this.date,
    required this.adjustment,
    required this.note,
    required this.nominal,
    required this.transactionNote,
  });
}
