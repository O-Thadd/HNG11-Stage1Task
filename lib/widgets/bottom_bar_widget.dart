import 'package:flutter/material.dart';
import 'package:hng11stage1task/main_screen.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key, required this.currentScreen, required this.goToScreen});

  final Screen currentScreen;
  final void Function(Screen screen) goToScreen;

  @override
  Widget build(BuildContext context) {
    final onHomeScreen = currentScreen == Screen.products;
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () { goToScreen(Screen.products); },
              child: Material(
                color:  onHomeScreen ? Colors.grey : null,
                child: Center(
                  child: Text(
                    'Products',
                    style: onHomeScreen
                        ? Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)
                        : Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: () { goToScreen(Screen.checkout); },
              child: Material(
                color:  !onHomeScreen ? Colors.grey : null,
                child: Center(
                  child: Text(
                  'Checkout',
                  style: !onHomeScreen
                      ? Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)
                      : Theme.of(context).textTheme.titleLarge,
                          ),
                ),
              ),
            ),),
        ],
      ),
    );
  }
}
