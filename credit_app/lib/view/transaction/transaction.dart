import 'package:credit_app/helper/formatter.dart';
import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/home/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction History',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.isLoading) {
              return Center(
                child: LoadingAnimationWidget.discreteCircle(
                    secondRingColor: kSecondaryColor,
                    thirdRingColor: kTertiaryColor,
                    color: kPrimaryColor,
                    size: 50),
              );
            }

            if (state.transactionHistory.isEmpty) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/empty.json'),
                      const Text('No data found',
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              );
            }

            return ListView.separated(
                itemBuilder: (context, index) {
                  var th = state.transactionHistory[index];
                  return ListTile(
                    leading: const Icon(CupertinoIcons.person_alt, size: 30),
                    title: Text(th.creditor),
                    subtitle: Text(Formatter().formatDateTime(th.dateStmp)),
                    trailing: Text(Formatter().formatCurrency(th.amount),
                        style: TextStyle(
                            color: th.isCredit ? Colors.red : Colors.green)),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.transactionHistory.length);
          },
        ),
      ),
    );
  }
}
