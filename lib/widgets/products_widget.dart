import 'package:flutter/material.dart';
import 'package:hng11stage1task/dummy_data.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key, required this.items, required this.onItemClicked});

  final List<ShoppingItem> items;
  final void Function(String itemName) onItemClicked;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: (){ onItemClicked(item.name); },
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
                    if (item.selected) const Icon(Icons.done_outline_sharp),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
