import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/model/kategori/detail/detailkategori_model.dart';
import 'package:coba1/src/core/viewmodel/add_produk/add_produk_vm.dart';
import 'package:coba1/src/ui/helper/add_kategori.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  final DetailProductKategori product;

  const EditProductScreen({
    super.key,
    required this.product,
    required Null Function(dynamic updatedProduct) onEdit,
  });

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _stockController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _priceController =
        TextEditingController(text: widget.product.price.toString());
    _stockController =
        TextEditingController(text: widget.product.stock.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Produk',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.neutral08,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => AddProductViewModel(),
        child: Consumer<AddProductViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Kode'),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primary500),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Nama Produk'),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primary500),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              return viewModel.validateNama(value ?? '');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Harga'),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: _priceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primary500),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              return viewModel.validateHarga(value ?? '');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          Text(
                            'Ubah Harga',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral08,
                            ),
                          ),
                          Text(
                            '*Required',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.danger05,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DropdownButtonFormField<String>(
                        value: viewModel.hargaBisaDiubahText,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primary500,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Select a option',
                            child: Text('Select a option'),
                          ),
                          DropdownMenuItem(
                            value: 'Harga tidak dapat diubah ketika transaksi',
                            child: Text(
                                'Harga tidak dapat diubah ketika transaksi'),
                          ),
                          DropdownMenuItem(
                            value: 'Harga dapat diubah ketika transaksi',
                            child: Text('Harga dapat diubah ketika transaksi'),
                          ),
                        ],
                        onChanged: (newValue) {
                          if (newValue != null) {
                            viewModel.setHargaBisaDiubah(newValue);
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: DropdownButtonFormField<String>(
                              value: viewModel.kategori,
                              items: viewModel.kategoriList
                                  .map((kategori) => DropdownMenuItem(
                                        value: kategori,
                                        child: Text(kategori),
                                      ))
                                  .toList(),
                              onChanged: (newKategori) {
                                viewModel.setKategori(newKategori ?? '');
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.primary500),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(120, 40),
                                backgroundColor: AppColors.primary500,
                              ),
                              onPressed: () {
                                DialogHelper.showAddCategoryDialog(context);
                              },
                              child: const Text(
                                'Tambah Kategori',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.neutral01,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Deskripsi Produk',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral08,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: viewModel.deskripsiController,
                            decoration: InputDecoration(
                              hintText: 'Deskripsi Produk',
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primary500),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pilih Pajak?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral08,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DropdownButtonFormField<String>(
                            value: viewModel.pilihPajak,
                            items: const [
                              DropdownMenuItem(
                                value: 'Select a option',
                                child: Text('Select a option'),
                              ),
                              DropdownMenuItem(
                                value: 'Produk Tidak Memakai Pajak',
                                child: Text('Produk Tidak Memakai Pajak'),
                              ),
                              DropdownMenuItem(
                                value: 'Produk Memakai Pajak',
                                child: Text('Produk Memakai Pajak'),
                              ),
                            ],
                            onChanged: (newValue) {
                              if (newValue != null) {
                                viewModel.setPilihPajak(newValue);
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primary500),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Nama Tipe Pajak',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral08,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: DropdownButtonFormField<String>(
                              value: viewModel.kategori,
                              items: viewModel.kategoriList
                                  .map((kategori) => DropdownMenuItem(
                                        value: kategori,
                                        child: Text(kategori),
                                      ))
                                  .toList(),
                              onChanged: (newKategori) {
                                viewModel.setKategori(newKategori ?? '');
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.primary500),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          // const SizedBox(width: 16),
                          const Text(
                            'Pilih Tipe Pajak',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral08,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: DropdownButtonFormField<String>(
                              value: viewModel.kategori,
                              items: viewModel.kategoriList
                                  .map((kategori) => DropdownMenuItem(
                                        value: kategori,
                                        child: Text(kategori),
                                      ))
                                  .toList(),
                              onChanged: (newKategori) {
                                viewModel.setKategori(newKategori ?? '');
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.primary500),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nilai Persenan Pajak(%)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral08,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: viewModel.deskripsiController,
                            decoration: InputDecoration(
                              hintText: 'contoh: 10%',
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primary500),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pilih Stok',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral08,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DropdownButtonFormField<String>(
                            value: viewModel.pilihStok,
                            items: const [
                              DropdownMenuItem(
                                value: 'Select a option',
                                child: Text('Select a option'),
                              ),
                              DropdownMenuItem(
                                value: 'Produk tidak dengan stok',
                                child: Text('Produk tidak dengan stok'),
                              ),
                              DropdownMenuItem(
                                value: 'Produk menggunakan stok',
                                child: Text('Produk menggunakan stok'),
                              ),
                            ],
                            onChanged: (newValue) {
                              if (newValue != null) {
                                viewModel.setPilihStok(newValue);
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primary500),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pilih Validasi',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral08,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DropdownButtonFormField<String>(
                            // value: viewModel.pilihStok,
                            items: const [
                              DropdownMenuItem(
                                value: 'Select a option',
                                child: Text('Select a option'),
                              ),
                              DropdownMenuItem(
                                value:
                                    'Stok habis, tidak diperbolehkan transaksi',
                                child: Text(
                                    'Stok habis, tidak diperbolehkan transaksi'),
                              ),
                              DropdownMenuItem(
                                value: 'Stok habis, diperbolehkan transaksi',
                                child:
                                    Text('Stok habis, diperbolehkan transaksi'),
                              ),
                            ],
                            onChanged: (newValue) {
                              if (newValue != null) {
                                viewModel.setPilihStok(newValue);
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primary500),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Jumlah Stok',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.neutral08,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: _stockController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primary500),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Deskripsi Stok',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.neutral08,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                // controller: _stockController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan Deskripsi Stok',
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primary500),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tambahkan Foto',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.neutral08,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                // controller: _stockController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Tambahkan Foto',
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primary500),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(427, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: AppColors.primary500,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Save logic here
                            widget.product.name = _nameController.text.trim();
                            widget.product.price =
                                double.parse(_priceController.text.trim());
                            widget.product.stock =
                                int.parse(_stockController.text.trim());
                            // Call the onSave callback if needed
                            // onSave(widget.product);
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text(
                          'Simpan Perubahan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.neutral01,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
