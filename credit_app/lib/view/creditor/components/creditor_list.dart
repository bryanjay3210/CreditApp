import 'dart:ui';

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
          return ImageFiltered(
            imageFilter: ImageFilter.blur(),
            enabled: true,
            child: ListTile(
              onTap: () {
                GetIt.I<CreditorHelper>().creditorId =
                    state.creditorList[index].creditorId;
                GetIt.I<CreditorHelper>().creditorIndex = index;
                context.pushNamed(RouteConstants.credit,
                    extra: state.creditorList[index].fullname);
              },
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: kTertiaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(CupertinoIcons.person_alt),
              ),
              title: Text(state.creditorList[index].fullname,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      )),
              subtitle: Row(
                children: [
                  Text(
                    state.creditorList[index].totalBalance > 0
                        ? 'Balance: '
                        : 'Available Credit: ',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    Formatter().formatCurrency(
                        state.creditorList[index].totalBalance.abs()),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: state.creditorList[index].totalBalance > 0
                            ? kPastelRed
                            : kPastelGreen),
                  ),
                ],
              ),
              trailing: state.creditorList[index].totalBalance > 0
                  ? Image.asset(
                      'assets/unpaid.png',
                      width: 50,
                    )
                  : const SizedBox(),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: state.creditorList.length);
  }
}
