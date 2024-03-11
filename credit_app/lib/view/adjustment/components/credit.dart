import 'package:credit_app/utility/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Credit extends StatefulWidget {
  const Credit({super.key});

  @override
  State<Credit> createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      leading: const CircleAvatar(
                          child: Icon(CupertinoIcons.person_alt)),
                      title: Text('Credit $index'),
                      subtitle: const Text('Datetime'),
                      trailing: const Text('P 1,000,000'),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 1),
                  itemCount: 20),
            ),
            SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(TextSpan(
                    text: 'Total Credit: ',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: 'P 1,000,000,000.00',
                          style: TextStyle(color: kPrimaryColor))
                    ])),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: const Icon(CupertinoIcons.add)),
    );
  }
}
