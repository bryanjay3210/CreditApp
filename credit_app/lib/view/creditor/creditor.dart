import 'package:credit_app/view/creditor/cubit/creditor_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

import '../../utility/const.dart';
import 'components/creditor_list.dart';

class CreditorScreen extends StatefulWidget {
  const CreditorScreen({super.key});

  @override
  State<CreditorScreen> createState() => _CreditorScreenState();
}

class _CreditorScreenState extends State<CreditorScreen> {
  final creditorNameCtrl = TextEditingController();

  @override
  void initState() {
    context.read<CreditorCubit>().getCreditor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Creditor')),
      body: BlocConsumer<CreditorCubit, CreditorState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.search),
                      hintText: 'Search'),
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
                        : state.creditorList.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.network(
                                      'https://lottie.host/cb80271e-58bb-41c6-95d5-bb60eeec4026/q4wNYtjvIP.json'),
                                  const Text('No data',
                                      style: TextStyle(fontSize: 20)),
                                ],
                              )
                            : CreditorList(state: state))
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add creditor'),
                content: TextFormField(
                  controller: creditorNameCtrl,
                  decoration: const InputDecoration(hintText: 'Creditor Name'),
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelMedium,
                    ),
                    child: const Text('Add'),
                    onPressed: () {
                      context.read<CreditorCubit>().addCreditor(
                          fullname: creditorNameCtrl.text, context: context);
                      creditorNameCtrl.clear();
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
              );
            },
          );
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
