import 'package:coba1/assets/color/app_colors.dart';
import 'package:coba1/navbar.dart';
import 'package:coba1/src/core/model/history/history_model.dart';
import 'package:coba1/src/core/viewmodel/history/history/history_vm.dart';
import 'package:coba1/src/ui/helper/filter_tgl.dart';
import 'package:coba1/src/ui/history/detail_transaksi._view.dart';
import 'package:coba1/src/ui/summary/summary_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController? _tabController;
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(() {
      setState(() {}); // Rebuild when tab changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final viewModel = HistoryViewModel();
        viewModel.loadTransactions();
        viewModel.loadSummaries();
        return viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'History',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Consumer<HistoryViewModel>(
                builder: (context, viewModel, child) {
                  return viewModel.transactions.isEmpty
                      ? Image.asset(
                          'asset/image/gradasi1.png',
                          fit: BoxFit.cover,
                          height: 200,
                        )
                      : const SizedBox();
                },
              ),
            ),
            Column(
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
                    Tab(text: 'History'),
                    Tab(text: 'Summary'),
                  ],
                ),
                const SizedBox(height: 16),
                Stack(
                  children: [
                    TextField(
                      controller: _dateController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'Selected Date',
                        contentPadding: EdgeInsets.all(16.0),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Image.asset(
                                  'asset/image/mage_filter-fill.png'),
                              onPressed: () async {
                                // Open the filter and get the selected date
                                final selectedDate =
                                    await showModalBottomSheet<DateTime>(
                                  context: context,
                                  builder: (context) {
                                    return const FilterPopup();
                                  },
                                );
                                if (selectedDate != null) {
                                  setState(() {
                                    // Update the TextEditingController with the selected date
                                    _dateController.text = selectedDate
                                        .toLocal()
                                        .toString()
                                        .split(' ')[0];
                                  });
                                }
                              },
                            ),
                            const Text('Filter'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Consumer<HistoryViewModel>(
                        builder: (context, viewModel, child) {
                          return viewModel.transactions.isEmpty
                              ? Center(
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
                                        'Kamu belum memiliki histori transaksi',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        'Semua history transaksi akan ditampilkan disini.',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: viewModel.transactions.length,
                                  itemBuilder: (context, index) {
                                    final transaction =
                                        viewModel.transactions[index];
                                    Color backgroundColor;
                                    String statusText;
                                    switch (transaction.status) {
                                      case TransactionStatus.success:
                                        backgroundColor = AppColors.primary500;
                                        statusText = 'Success';
                                        break;
                                      case TransactionStatus.failed:
                                        backgroundColor = AppColors.danger05;
                                        statusText = 'Failed';
                                        break;
                                      case TransactionStatus.cancelled:
                                        backgroundColor = AppColors.warning05;
                                        statusText = 'Cancelled';
                                        break;
                                      default:
                                        backgroundColor = Colors.transparent;
                                        statusText = '';
                                    }

                                    return Card(
                                      color: AppColors.neutral01,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 6),
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.all(8.0),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Transaksi ${transaction.id}',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: backgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Text(
                                                    statusText,
                                                    style: const TextStyle(
                                                      color:
                                                          AppColors.neutral01,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              '\$${transaction.amount}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.primary500),
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  transaction.type,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.neutral08,
                                                  ),
                                                ),
                                                Text(
                                                  transaction.date,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.neutral08,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TransactionDetailPage(
                                                transaction: transaction,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                        },
                      ),
                      const SummaryPage(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: NavbarPage(
          currentIndex: 2,
          onTap: (index) {},
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}
