import 'package:credit_app/helper/creditor.dart';
import 'package:credit_app/helper/formatter.dart';
import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/creditor/cubit/creditor_cubit.dart';
import 'package:credit_app/view/creditor_information/cubit/creditor_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    return BlocBuilder<CreditorCubit, CreditorState>(
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) {
              return Slidable(
                startActionPane:
                    ActionPane(motion: const StretchMotion(), children: [
                  SlidableAction(
                    onPressed: (context1) {
                      context1.pushNamed(RouteConstants.creditorInformation,
                          queryParameters: {
                            'creditorId': state.creditorList[index].creditorId,
                            'isEdit': 'true'
                          }).then((_) {
                        context.read<CreditorCubit>().getCreditor();
                        context.read<CreditorInformationCubit>().resetData();
                      });
                    },
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                    padding: const EdgeInsets.all(5),
                  ),
                  SlidableAction(
                    onPressed: (context) => showDialog<String>(
                      context: context,
                      builder: (BuildContext dialogcontext) => AlertDialog(
                        title: const Text('Delete creditor'),
                        content: Text(
                            'Are your sure your want to delete ${state.creditorList[index].fullname}?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              dialogcontext
                                  .read<CreditorCubit>()
                                  .deleteCreditor(
                                      creditorId:
                                          state.creditorList[index].creditorId,
                                      context: dialogcontext)
                                  .then((value) => dialogcontext
                                      .read<CreditorCubit>()
                                      .getCreditor()
                                      .then((value) => dialogcontext.pop()));
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () => dialogcontext.pop(),
                            child: const Text('No'),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                    padding: const EdgeInsets.all(5),
                  )
                ]),
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
                    child: state.creditorList[index].base64Image == null
                        ? Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset('assets/no_photo.png'))
                        : Image.memory(state.creditorList[index].base64Image!,
                            fit: BoxFit.cover),
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
      },
    );
  }
}
