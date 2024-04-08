import 'package:flutter/material.dart';

class PopupMenu<T> extends StatelessWidget {
  const PopupMenu({
    super.key,
    required this.initialValue,
    required this.onSelected,
    required this.itemBuilder,
    required this.selectedItem,
  });

  final T? initialValue;
  final ValueChanged<T>? onSelected;
  final PopupMenuItemBuilder<T> itemBuilder;
  final String selectedItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(3),
      ),
      child: PopupMenuButton(
        initialValue: initialValue,
        onSelected: onSelected,
        itemBuilder: itemBuilder,
        popUpAnimationStyle: AnimationStyle(
          duration: const Duration(milliseconds: 20),
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide.none,
        ),
        tooltip: '',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.50),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                selectedItem,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
