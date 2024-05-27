import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/navbar.dart';
import 'package:coba1/src/core/viewmodel/add_produk/add_produk_vm.dart';
import 'package:coba1/src/core/viewmodel/home/home_vm.dart';
import 'package:coba1/src/core/viewmodel/kategori/kategori_vm.dart';
import 'package:coba1/src/ui/add_produk/add_produk_view.dart';
import 'package:coba1/src/ui/checkout/checkout_view.dart';
import 'package:coba1/src/ui/home/view/grid_vew.dart';
import 'package:coba1/src/ui/home/view/list_view.dart';
import 'package:coba1/src/ui/kategori/kategori_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/model/home/get_date/list_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isGridView = false;
  int _selectedIndex = 0;
  String _selectedCategoryId = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
    Provider.of<HomeViewModel>(context, listen: false).fetchProducts();
    Provider.of<HomeViewModel>(context, listen: false).fetchCategories();
  }

  void _onCategorySelected(String categoryId) {
    setState(() {
      _selectedCategoryId = categoryId;
    });
    Provider.of<HomeViewModel>(context, listen: false)
        .filterByCategory(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => HomeViewModel()
              ..fetchProducts()
              ..fetchCategories()),
        ChangeNotifierProvider(
            create: (_) => CategoryViewModel()..fetchCategories()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('POS Kasir'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
                indicatorColor: AppColors.primary500,
                indicator: BoxDecoration(
                  color: AppColors.primary500,
                  borderRadius: BorderRadius.circular(8),
                ),
                labelColor: AppColors.neutral01,
                unselectedLabelColor: AppColors.neutral08,
                tabs: const [
                  Tab(text: 'Produk'),
                  Tab(text: 'Kategori'),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: _selectedIndex == 0
                            ? 'Cari Barang'
                            : 'Cari Kategori',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (_selectedIndex == 0) ...[
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (context) => AddProductViewModel(),
                              child: const AddProductScreen(),
                            ),
                          ),
                        );
                      },
                      icon: Image.asset(
                        'asset/image/Box_Product.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isGridView ? Icons.grid_view_rounded : Icons.list,
                        color: AppColors.primary500,
                      ),
                      onPressed: () {
                        setState(() {
                          isGridView = !isGridView;
                        });
                      },
                    ),
                  ] else if (_selectedIndex == 1) ...[
                    Consumer<CategoryViewModel>(
                      builder: (context, viewModel, child) {
                        return OutlinedButton(
                          onPressed: () {
                            viewModel.toggleSelecting();
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: AppColors.primary500,
                            ),
                          ),
                          child: Text(
                            viewModel.isSelecting ? 'Cancel' : 'Select',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary500,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 5),
              if (_selectedIndex == 0)
                Consumer<HomeViewModel>(
                  builder: (context, viewModel, child) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(110, 35),
                              backgroundColor: _selectedCategoryId == ''
                                  ? AppColors.primary500
                                  : AppColors.neutral01,
                              side: const BorderSide(
                                color: AppColors.primary500,
                              ),
                            ),
                            onPressed: () {
                              _onCategorySelected('');
                            },
                            child: Text(
                              'Semua',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: _selectedCategoryId == ''
                                    ? AppColors.neutral01
                                    : AppColors.primary500,
                              ),
                            ),
                          ),
                          ...viewModel.categories.map((category) {
                            final isSelected =
                                _selectedCategoryId == category.id;
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(110, 35),
                                backgroundColor: isSelected
                                    ? AppColors.primary500
                                    : AppColors.neutral01,
                                side: const BorderSide(
                                  color: AppColors.primary500,
                                ),
                              ),
                              onPressed: () {
                                _onCategorySelected(category.id);
                              },
                              child: Text(
                                category.name,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: isSelected
                                      ? AppColors.neutral01
                                      : AppColors.primary500,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  },
                ),
              const SizedBox(height: 5),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Consumer<HomeViewModel>(
                      builder: (context, viewModel, child) {
                        return isGridView
                            ? GridViewWidget(products: viewModel.filteredItems)
                            : ListViewWidget(products: viewModel.filteredItems);
                      },
                    ),
                    const CategoryPage(),
                  ],
                ),
              ),
              if (_selectedIndex == 0)
                Consumer<HomeViewModel>(
                  builder: (context, viewModel, child) {
                    return ElevatedButton(
                      onPressed: viewModel.isCartEmpty
                          ? null
                          : () {
                              if (!viewModel.isCartEmpty) {
                                List<Product> selectedProducts =
                                    viewModel.cartItems;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckoutPage(
                                      selectedProducts: selectedProducts,
                                    ),
                                  ),
                                );
                              }
                            },
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(327, 40)),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return AppColors.neutral03;
                          }
                          return AppColors.primary500;
                        }),
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
        bottomNavigationBar: NavbarPage(
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              // Home button pressed
            } else if (index == 1) {
              // Other button pressed
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
