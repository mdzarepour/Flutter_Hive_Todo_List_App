import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeViewAppbarState extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeViewAppbarState({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return PreferredSize(
      preferredSize: const Size.fromWidth(200),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: scheme.surface,
        actionsPadding: const EdgeInsets.only(right: 15),
        title: InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(size: 30, color: scheme.onSurface, Iconsax.menu_1),
        ),
        actions: const [Icon(Iconsax.trash)],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
