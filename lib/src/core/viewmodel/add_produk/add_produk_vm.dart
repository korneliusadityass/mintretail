import 'package:flutter/material.dart';

class AddProductViewModel extends ChangeNotifier {
  TextEditingController kodeController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  final TextEditingController pajakPersenController = TextEditingController();

  String pilihPajak = 'Select a option';
  String pilihStok = 'Select a option';
  String pilihPajakIncludeExclude = 'Select a option';
  String _pilihPajakText = '';

  List<String> kategoriList = ['Kategori 1', 'Kategori 2', 'Kategori 3'];
  String kategori = 'Kategori 1';

  bool hargaBisaDiubah = false;
  String hargaBisaDiubahText = 'Select a option';
  String get pilihPajakText => _pilihPajakText;

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

  void setPilihPajakIncludeExclude(String newValue) {
    pilihPajakIncludeExclude = newValue;
    notifyListeners();
  }

  void setPilihPajakText(String newValue) {
    _pilihPajakText = newValue;
    notifyListeners(); 
  }

  @override
  void dispose() {
    kodeController.dispose();
    namaController.dispose();
    hargaController.dispose();
    deskripsiController.dispose();
    pajakPersenController.dispose();
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
    return null;
  }

  String? validateKode(String value) {
    if (value.isEmpty) {
      return 'Kode harus diisi!';
    }
    return null;
  }

  String? validateUbahHarga(String value) {
    if (value.isEmpty) {
      return 'Ubah harus diisi';
    }
    return null;
  }

  String? validateKategori(String value) {
    if (value.isEmpty) {
      return 'Kategori harus diisi';
    }
    return null;
  }
}
