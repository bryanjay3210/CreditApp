import 'package:credit_app/helper/formatter.dart';
import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/home/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().computeTotal();
    context.read<HomeCubit>().getUser();
    context.read<HomeCubit>().getTransactionHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: kDefaultColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Hi ${state.fullname.toUpperCase()}!',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      context.read<HomeCubit>().toogleIsShow();
                                    },
                                    icon: Icon(
                                      state.isShow
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Column(
                                  children: [
                                    Text('Total Credit',
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Total Debit',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                        state.isShow
                                            ? Formatter().formatCurrency(
                                                state.totalCredit)
                                            : '***************',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        state.isShow
                                            ? Formatter().formatCurrency(
                                                state.totalDebit)
                                            : '***************',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17)),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Transaction',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () => context
                                .pushNamed(RouteConstants.creditor)
                                .then((value) {
                              context.read<HomeCubit>().computeTotal();
                              context.read<HomeCubit>().getTransactionHistory();
                            }),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  const Icon(CupertinoIcons.person_2_alt),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('Creditor',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Transaction History',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: state.isLoading
                            ? Center(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                    color: kDefaultColor, size: 40),
                              )
                            : state.transactionHistory.isEmpty
                                ? Center(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Lottie.network(
                                              'https://lottie.host/cb80271e-58bb-41c6-95d5-bb60eeec4026/q4wNYtjvIP.json',
                                              height: 250),
                                          const Text('No data.',
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                  )
                                : ListView.separated(
                                    itemBuilder: (context, index) {
                                      var th = state.transactionHistory[index];
                                      return ListTile(
                                        leading: const Icon(
                                            CupertinoIcons.person_alt,
                                            size: 30),
                                        title: Text(th.creditor),
                                        subtitle: Text(Formatter()
                                            .formatDateTime(th.dateStmp)),
                                        trailing: Text(
                                            Formatter()
                                                .formatCurrency(th.amount),
                                            style: TextStyle(
                                                color: th.isCredit
                                                    ? kDefaultColor
                                                    : Colors.green)),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: state.transactionHistory.length))
                  ]),
            ),
          );
        },
      ),
    );
  }
}
