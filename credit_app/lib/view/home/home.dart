import 'package:credit_app/routes/route_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search), hintText: 'Search'),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => context.pushNamed(RouteConstants.menu),
                    leading: const CircleAvatar(
                        child: Icon(CupertinoIcons.person_alt)),
                    title: Text('Person $index'),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1),
                itemCount: 20),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add creditor'),
                content: TextFormField(
                  decoration: const InputDecoration(hintText: 'Creditor Name'),
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Add'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
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
