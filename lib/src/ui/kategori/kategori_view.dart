import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/src/core/model/kategori/kategori_model.dart';
import 'package:coba1/src/core/viewmodel/kategori/kategori_vm.dart';
import 'package:coba1/src/ui/helper/kategori/detail/detaikatergori_view.dart';
import 'package:coba1/src/ui/helper/kategori/edit/edit_kategori.dart';
import 'package:coba1/src/ui/helper/kategori/edit/tambah_kategori.dart';
import 'package:coba1/src/ui/helper/kategori/hapus/hapus_kategori.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryViewModel()..fetchCategories(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Daftar Kategori',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Consumer<CategoryViewModel>(
                  builder: (context, viewModel, child) {
                    if (viewModel.categories.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'asset/image/no_history.png',
                              width: 200,
                              height: 200,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Belum ada daftar kategori',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Seluruh list kategori akan ditampilkan disini.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: viewModel.displayedCategories.length,
                      itemBuilder: (context, index) {
                        CategoryProduk category =
                            viewModel.displayedCategories[index];
                        return Card(
                          color: AppColors.neutral01,
                          child: ListTile(
                            title: Text(category.name),
                            trailing: viewModel.isSelecting
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Image.asset(
                                            'asset/image/edit_ktgry.png'),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return EditCategoryDialog(
                                                initialName: category.name,
                                                onEdit: (newName) {
                                                  viewModel.updateCategoryName(
                                                      category.id, newName);
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: Image.asset(
                                            'asset/image/trash.png'),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return DeleteCategoryDialog(
                                                categoryName: category.name,
                                                onDelete: () {
                                                  viewModel.deleteCategory(
                                                      category.id);
                                                  Navigator.of(context).pop();
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                : IconButton(
                                    icon: const Icon(Icons.chevron_right),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const KategoriProductDetailsPage(),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 56.0,
          height: 56.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary500,
          ),
          child: IconButton(
            icon: const Icon(Icons.add, color: AppColors.neutral01),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const TambahCategoryDialog();
                },
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
