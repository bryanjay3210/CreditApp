import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Debit extends StatefulWidget {
  const Debit({super.key});

  @override
  State<Debit> createState() => _DebitState();
}

class _DebitState extends State<Debit> {
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
                      title: Text('Debit $index'),
                      subtitle: const Text('Datetime'),
                      trailing: const Text('P 1,000,000'),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 1),
                  itemCount: 20),
            ),
            const SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(TextSpan(
                    text: 'Total Debit: ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: 'P 1,000,000,000.00',
                          style: TextStyle(color: Colors.green))
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
