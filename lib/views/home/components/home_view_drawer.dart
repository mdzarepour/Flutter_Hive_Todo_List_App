import 'package:flutter/material.dart';
import 'package:hive_todo/core/constants/app_colors.dart';
import 'package:hive_todo/data/drawe_item_data.dart';
import 'package:hive_todo/extentions/space_exs.dart';
import 'package:iconsax/iconsax.dart';

class HomeViewDrawer extends StatefulWidget {
  const HomeViewDrawer({super.key});

  @override
  State<HomeViewDrawer> createState() => _HomeViewDrawerState();
}

class _HomeViewDrawerState extends State<HomeViewDrawer> {
  final drawerItems = DraweItemData().drawerItems;
  int selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: scheme.secondary,
      child: Column(
        children: [
          100.h,
          Icon(size: 90, color: scheme.onSurface, Iconsax.tick_circle),
          40.h,
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: drawerItems.length,
              itemBuilder: (context, index) {
                return _generateDraweItems(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  _generateDraweItems(int index) {
    bool isSeleted = index == selectedItemIndex;
    return ListTile(
      onTap: () {
        setState(() {
          selectedItemIndex = index;
        });
      },
      splashColor: Colors.transparent,
      selected: isSeleted,
      selectedColor: AppColors.materialGrey,
      title: Text(drawerItems[index].title),
      leading: Icon(drawerItems[index].icon),
    );
  }
}
