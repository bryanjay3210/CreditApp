import 'package:credit_app/helper/formatter.dart';
import 'package:credit_app/view/credit/cubit/debit_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

import '../../../utility/const.dart';

class Debit extends StatefulWidget {
  const Debit({super.key});

  @override
  State<Debit> createState() => _DebitState();
}

class _DebitState extends State<Debit> {
  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final debitKey = GlobalKey<FormState>();
  @override
  void initState() {
    context.read<DebitCubit>().getDebitList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<DebitCubit, DebitState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.isLoading) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: kPrimaryColor, size: 40),
              );
            }
            if (!state.isLoading && state.debitList.isEmpty) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/empty.json'),
                      const Text('No debit found',
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        var debit = state.debitList[index];
                        return ListTile(
                          onTap: () {},
                          leading: Icon(CupertinoIcons.money_dollar_circle_fill,
                              size: 40, color: kPastelGreen),
                          title: Text(debit.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontWeight: FontWeight.w600)),
                          subtitle: Text(
                            Formatter().formatDateTime(debit.dateStmp),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          trailing: Text(
                            Formatter().formatCurrency(debit.amount),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: kPastelGreen),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(thickness: 1),
                      itemCount: state.debitList.length),
                ),
                SizedBox(
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(TextSpan(
                        text: 'Total Debit: ',
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: [
                          TextSpan(
                              text:
                                  Formatter().formatCurrency(state.totalDebit),
                              style: TextStyle(color: kPastelGreen))
                        ])),
                  ),
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return Form(
                  key: debitKey,
                  child: AlertDialog(
                    title: const Text('Add Debit'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: titleCtrl,
                          decoration: const InputDecoration(hintText: 'Title'),
                          validator: (value) =>
                              value!.isEmpty ? 'Title is required!' : null,
                        ),
                        TextFormField(
                          controller: descriptionCtrl,
                          decoration:
                              const InputDecoration(hintText: 'Description'),
                        ),
                        TextFormField(
                          controller: amountCtrl,
                          decoration: const InputDecoration(hintText: 'Amount'),
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              value!.isEmpty ? 'Amount is required!' : null,
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelMedium,
                        ),
                        child: const Text('Add'),
                        onPressed: () {
                          if (debitKey.currentState!.validate()) {
                            context
                                .read<DebitCubit>()
                                .addDebit(
                                    title: titleCtrl.text,
                                    description: descriptionCtrl.text,
                                    amount: double.parse(amountCtrl.text))
                                .then((value) {
                              context.read<DebitCubit>().getDebitList();
                              titleCtrl.clear();
                              descriptionCtrl.clear();
                              amountCtrl.clear();
                              context.pop();
                            });
                          }
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelMedium,
                        ),
                        child: const Text('Cancel'),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(CupertinoIcons.add)),
    );
  }
}
