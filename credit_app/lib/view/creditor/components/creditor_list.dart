import 'package:credit_app/helper/creditor.dart';
import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/view/creditor/cubit/creditor_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class CreditorList extends StatelessWidget {
  final CreditorState state;
  const CreditorList({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              GetIt.I<CreditorHelper>().creditorId =
                  state.creditorList[index].creditorId;
              GetIt.I<CreditorHelper>().creditorIndex = index;
              context.pushNamed(RouteConstants.menu);
            },
            leading: const CircleAvatar(child: Icon(CupertinoIcons.person_alt)),
            subtitle:
                Text('Balance: ₱ ${state.creditorList[index].totalBalance}'),
            title: Text(state.creditorList[index].fullname),
            // trailing: const Text('Unpaid'),
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemCount: state.creditorList.length);
  }
}
