import 'package:credit_app/view/credit/components/credit.dart';
import 'package:credit_app/view/credit/components/debit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditScreen extends StatefulWidget {
  const CreditScreen({super.key});

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Credit/Debit Entry'),
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
