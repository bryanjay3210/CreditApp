import 'package:credit_app/view/adjustment/components/credit.dart';
import 'package:credit_app/view/adjustment/components/debit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdjustmentScreen extends StatefulWidget {
  const AdjustmentScreen({super.key});

  @override
  State<AdjustmentScreen> createState() => _AdjustmentScreenState();
}

class _AdjustmentScreenState extends State<AdjustmentScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adjustment Entry'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(CupertinoIcons.creditcard), text: 'Credit'),
              Tab(icon: Icon(CupertinoIcons.money_dollar), text: 'Debit'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Credit(),
            Debit(),
          ],
        ),
      ),
    );
  }
}
