import 'package:credit_app/models/creditor.dart';
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
  final searchCtrl = TextEditingController();
  final creditorKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<CreditorCubit>().getCreditor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreditorCubit, CreditorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: state.inSearch
                  ? TextFormField(
                      autofocus: true,
                      controller: searchCtrl,
                      decoration: const InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: (value) =>
                          context.read<CreditorCubit>().searchCreditor(value),
                    )
                  : const Text('Creditor'),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () {
                        context
                            .read<CreditorCubit>()
                            .toogleSearch(value: !state.inSearch);
                        searchCtrl.clear();
                        context.read<CreditorCubit>().searchCreditor('');
                      },
                      icon: Icon(state.inSearch ? Icons.close : Icons.search)),
                )
              ]),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                // TextFormField(
                //   controller: searchCtrl,
                //   decoration: const InputDecoration(
                //       prefixIcon: Icon(CupertinoIcons.search),
                //       hintText: 'Search'),
                //   onChanged: (value) =>
                //       context.read<CreditorCubit>().searchCreditor(value),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: state.isLoading
                        ? Center(
                            child: LoadingAnimationWidget.discreteCircle(
                                secondRingColor: kSecondaryColor,
                                thirdRingColor: kTertiaryColor,
                                color: kPrimaryColor,
                                size: 50),
                          )
                        : state.creditorList.isEmpty
                            ? Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Lottie.asset('assets/empty.json'),
                                      const Text('No creditor found',
                                          style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
                                ),
                              )
                            : CreditorList(state: state))
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return Form(
                    key: creditorKey,
                    child: AlertDialog(
                      title: const Text('Add creditor'),
                      content: TextFormField(
                        controller: creditorNameCtrl,
                        decoration:
                            const InputDecoration(hintText: 'Creditor Name'),
                        maxLength: 50,
                        validator: (value) =>
                            value!.isEmpty ? 'Creditor name is required' : null,
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelMedium,
                          ),
                          child: const Text('Add'),
                          onPressed: () {
                            if (creditorKey.currentState!.validate()) {
                              context.read<CreditorCubit>().addCreditor(
                                  fullname: creditorNameCtrl.text,
                                  context: context);
                              creditorNameCtrl.clear();
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
            child: const Icon(CupertinoIcons.add),
          ),
        );
      },
    );
  }
}
