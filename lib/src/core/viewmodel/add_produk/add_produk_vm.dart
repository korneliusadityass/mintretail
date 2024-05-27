import 'package:flutter/material.dart';

class AddProductViewModel extends ChangeNotifier {
  TextEditingController kodeController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  String pilihPajak = 'Select a option';
  String pilihStok = 'Select a option';

  List<String> kategoriList = ['Kategori 1', 'Kategori 2', 'Kategori 3'];
  String kategori = 'Kategori 1';

  bool hargaBisaDiubah = false;
  String hargaBisaDiubahText = 'Select a option';

  void setKategori(String newKategori) {
    kategori = newKategori;
    notifyListeners();
  }

  void setHargaBisaDiubah(String newValue) {
    hargaBisaDiubahText = newValue;
    hargaBisaDiubah = newValue == 'Harga dapat diubah ketika transaksi';
    notifyListeners();
  }

  void setPilihPajak(String newValue) {
    pilihPajak = newValue;
    notifyListeners();
  }

  void setPilihStok(String newValue) {
    pilihStok = newValue;
    notifyListeners();
  }

  @override
  void dispose() {
    kodeController.dispose();
    namaController.dispose();
    hargaController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  String? validateNama(String value) {
    if (value.isEmpty) {
      return 'Nama produk harus diisi';
    }
    return null;
  }

  String? validateHarga(String value) {
    if (value.isEmpty) {
      return 'Harga harus diisi';
    }
    // Tambahan validasi lainnya sesuai kebutuhan
    return null;
  }
}
