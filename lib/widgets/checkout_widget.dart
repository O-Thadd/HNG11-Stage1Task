import 'package:flutter/material.dart';
import 'package:hng11stage1task/dummy_data.dart';
import 'package:hng11stage1task/success_screen.dart';

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget(
      {super.key,
      required this.items,
      required this.onItemClicked,
      required this.onCheckoutClicked});

  final List<ShoppingItem> items;
  final Function(String itemName) onItemClicked;
  final void Function() onCheckoutClicked;

  @override
  Widget build(BuildContext context) {
    return items.isNotEmpty
        ? Stack(
            children: [
              ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Material(
                      color: Colors.black12,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                onItemClicked(item.name);
                              },
                              child: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SuccessScreen();
                      },
                    ));
                    Future.delayed(const Duration(milliseconds: 100), () {
                      onCheckoutClicked();
                    });
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Text('Checkout',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          )
        : const Center(
            child: Text(
              "You've not selected any items.\nYour items will appear.",
              textAlign: TextAlign.center,
            ),
          );
  }
}
