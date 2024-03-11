import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/menu/components/menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 250,
                width: 400,
                child: Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_jmuq5aha.json',
                    repeat: true,
                    animate: true),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MenuTile(
                        lottieUrl:
                            'https://assets3.lottiefiles.com/packages/lf20_ty4pchuq.json',
                        tileColor: kPrimaryColor,
                        title: 'Debit/Credit',
                        description:
                            'Indicate where value is flowing into and out of a business.',
                        func: () => context.pushNamed(RouteConstants.credit),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      MenuTile(
                        lottieUrl:
                            'https://assets7.lottiefiles.com/packages/lf20_nk07t8urDe.json',
                        tileColor: Colors.amber,
                        title: 'Adjustment',
                        description:
                            'Provides a brief explanation of the nature of the adjustment being made.',
                        func: () =>
                            context.pushNamed(RouteConstants.adjustment),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
