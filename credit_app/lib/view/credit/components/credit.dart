import 'package:credit_app/helper/formatter.dart';
import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/credit/cubit/credit_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class Credit extends StatefulWidget {
  const Credit({super.key});

  @override
  State<Credit> createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final creditKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<CreditCubit>().getCreditList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<CreditCubit, CreditState>(
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
            if (!state.isLoading && state.creditList.isEmpty) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/empty.json'),
                      const Text('No credit found',
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
                        var credit = state.creditList[index];
                        return ListTile(
                          onTap: () {},
                          leading: Icon(CupertinoIcons.money_dollar_circle_fill,
                              size: 40, color: kPastelRed),
                          title: Text(credit.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontWeight: FontWeight.w600)),
                          subtitle: Text(
                            Formatter().formatDateTime(credit.dateStmp),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          trailing: Text(
                            Formatter().formatCurrency(credit.amount),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: kPastelRed),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(thickness: 1),
                      itemCount: state.creditList.length),
                ),
                SizedBox(
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(TextSpan(
                        text: 'Total Credit: ',
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: [
                          TextSpan(
                              text:
                                  Formatter().formatCurrency(state.totalCredit),
                              style: TextStyle(color: kPastelRed))
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
                  key: creditKey,
                  child: AlertDialog(
                    title: const Text('Add Credit'),
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
                          if (creditKey.currentState!.validate()) {
                            context
                                .read<CreditCubit>()
                                .addCredit(
                                    title: titleCtrl.text,
                                    description: descriptionCtrl.text,
                                    amount: double.parse(amountCtrl.text))
                                .then((value) {
                              context.read<CreditCubit>().getCreditList();
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
