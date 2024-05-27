import 'package:flutter/foundation.dart';
import 'package:coba1/src/core/model/history/history_model.dart';

class TransactionDetailViewModel extends ChangeNotifier {
  final Transaction transaction;

  TransactionDetailViewModel(this.transaction);

  // Add any necessary methods and properties here
  String getStatusText() {
    switch (transaction.status) {
      case TransactionStatus.success:
        return 'Sukses';
      case TransactionStatus.failed:
        return 'Gagal';
      case TransactionStatus.cancelled:
        return 'Dibatalkan';
      default:
        return '';
    }
  }
}
