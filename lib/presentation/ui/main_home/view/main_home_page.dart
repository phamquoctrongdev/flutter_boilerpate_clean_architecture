import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/app_router.dart';

enum MainHomeType {
  home,
  profile,
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final current = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListenableBuilder(
          listenable: current,
          builder: (context, child) {
            return BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: '', icon: Icon(Icons.person)),
              ],
              onTap: (int index) {
                if (index == 1) {
                  context.push(AppRouter.profileChildTemp);
                } else {
                  context.push(AppRouter.user);
                }
                current.value = index;
              },
              selectedItemColor: Colors.red,
              currentIndex: current.value,
            );
          }),
      body: widget.child,
    );
  }
}
