import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/viewmodel/add_produk/add_produk_vm.dart';
import 'package:coba1/src/ui/helper/add_kategori.dart';
import 'package:coba1/src/ui/helper/kategori/detail/detaikatergori_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.neutral08,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AddProductViewModel>(
          builder: (context, viewModel, child) {
            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Row(
                        children: [
                          Text(
                            'Kode',
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
                      TextFormField(
                        controller: viewModel.kodeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primary500,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          hintText: 'Contoh: SKU',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Nama Produk',
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
                          TextFormField(
                            controller: viewModel.namaController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primary500,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              hintText: 'Contoh: Sate Padang',
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              return viewModel.validateNama(value ?? '');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Harga',
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
                          TextFormField(
                            controller: viewModel.hargaController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primary500,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              hintText: 'Rp.0',
                            ),
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              return viewModel.validateHarga(value ?? '');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
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
                      const SizedBox(height: 16.0),
                      const Row(
                        children: [
                          Text(
                            'Kategori',
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
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
                            ),
                          ),
                          const SizedBox(width: 16.0),
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
                      const SizedBox(height: 16.0),
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
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primary500,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              hintText:
                                  'Contoh : Makanan Nusantara dengan ....',
                            ),
                            keyboardType: TextInputType.multiline,
                            // maxLines: 1,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
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
                          const SizedBox(width: 8.0),
                          DropdownButtonFormField<String>(
                            value: viewModel.pilihPajak,
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      if (viewModel.pilihPajakText ==
                          'Produk Memakai Pajak') ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Nama Tipe Pajak',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.neutral08,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: 185,
                                  height: 40,
                                  child: DropdownButtonFormField<String>(
                                    value: viewModel.pilihPajak.isEmpty
                                        ? null
                                        : viewModel.pilihPajak,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.primary500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      hintText: 'Select a option',
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'Select a option',
                                        child: Text('Select a option'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'ppn',
                                        child: Text('PPN'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'pph',
                                        child: Text('PPH'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'pb1',
                                        child: Text('PB1'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'pdr',
                                        child: Text('PDR'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'pdh',
                                        child: Text('PDH'),
                                      ),
                                    ],
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        viewModel.setPilihPajak(newValue);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Pilih Tipe Pajak',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.neutral08,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: 185,
                                  height: 40,
                                  child: DropdownButtonFormField<String>(
                                    value: viewModel
                                            .pilihPajakIncludeExclude.isEmpty
                                        ? null
                                        : viewModel.pilihPajakIncludeExclude,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.primary500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      hintText: 'Select a option',
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'Select a option',
                                        child: Text('Select a option'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Exclude',
                                        child: Text('Exclude'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Include',
                                        child: Text('Include'),
                                      ),
                                    ],
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        viewModel.setPilihPajakIncludeExclude(
                                            newValue);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Nilai persen pajak (%)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.neutral08,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: viewModel.pajakPersenController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primary500),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            hintText: 'Contoh: 10%',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                      const SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
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
                          const SizedBox(width: 8.0),
                          DropdownButtonFormField<String>(
                            value: viewModel.pilihStok,
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
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
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(427, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: AppColors.primary500,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const KategoriProductDetailsPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Tambahkan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.neutral01,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
