import 'package:credit_app/helper/creditor.dart';
import 'package:credit_app/helper/formatter.dart';
import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/utility/const.dart';
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
              context.pushNamed(RouteConstants.credit);
            },
            tileColor: kPrimaryColor,
            leading: const CircleAvatar(
              child: Icon(CupertinoIcons.person_alt),
            ),
            title: Text(state.creditorList[index].fullname,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.white)),
            subtitle: Row(
              children: [
                Text(
                  'Balance: ',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  Formatter()
                      .formatCurrency(state.creditorList[index].totalBalance),
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            trailing: state.creditorList[index].totalBalance > 0
                ? Text('Unpaid',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.white))
                : const SizedBox(),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: state.creditorList.length);
  }
}
