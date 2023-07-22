import 'package:credit_app/helper/formatter.dart';
import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/home/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                                .then((value) =>
                                    context.read<HomeCubit>().computeTotal()),
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
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return const ListTile(
                                leading:
                                    Icon(CupertinoIcons.person_alt, size: 30),
                                title: Text('Creditor'),
                                subtitle: Text('Date'),
                                trailing: Text('P 1,000,000'),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: 20))
                  ]),
            ),
          );
        },
      ),
    );
  }
}
