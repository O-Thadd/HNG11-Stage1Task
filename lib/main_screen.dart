import 'package:flutter/cupertino.dart';
import 'package:hng11stage1task/dummy_data.dart';
import 'package:hng11stage1task/widgets/products_widget.dart';
import 'package:hng11stage1task/widgets/bottom_bar_widget.dart';
import 'package:hng11stage1task/widgets/checkout_widget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  final items = shoppingItems;
  Screen currentScreen = Screen.products;

  List<ShoppingItem> getSelectedItems() =>
      items.where((element) => element.selected).toList();

  void alterItemSelection(String itemName) {
    items.firstWhere((element) => element.name == itemName).alterSelection();
  }

  void goToScreen(Screen screen) {
    if (screen == currentScreen) {
      return;
    }
    currentScreen = screen;
  }

  void reset() {
    for (var element in items) {
      element.selected = false;
    }
    currentScreen = Screen.products;
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: switch (widget.currentScreen) {
              Screen.products => ProductsWidget(
                  items: widget.items,
                  onItemClicked: (itemName) {
                    setState(() {
                      widget.alterItemSelection(itemName);
                    });
                  },
                ),
              Screen.checkout => CheckoutWidget(
                  items: widget.getSelectedItems(),
                  onItemClicked: (String itemName) {
                    setState(() {
                      widget.alterItemSelection(itemName);
                    });
                  },
                  onCheckoutClicked: (){ setState(() { widget.reset(); }); },
                ),
            },
          ),
        ),
        const SizedBox(height: 6),
        BottomBarWidget(
          currentScreen: widget.currentScreen,
          goToScreen: (Screen screen) {
            setState(() {
              widget.goToScreen(screen);
            });
          },
        )
      ],
    );
  }
}

enum Screen {
  products,
  checkout;
}
