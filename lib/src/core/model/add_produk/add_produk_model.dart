// product_model.dart

class AddProduct {
  String kode;
  String nama;
  double harga;
  bool hargaBisaDiubah;
  String kategori;
  String deskripsi;
  bool menggunakanPajak;
  bool menggunakanStok;

  AddProduct({
    required this.kode,
    required this.nama,
    required this.harga,
    required this.hargaBisaDiubah,
    required this.kategori,
    required this.deskripsi,
    required this.menggunakanPajak,
    required this.menggunakanStok,
  });
}
