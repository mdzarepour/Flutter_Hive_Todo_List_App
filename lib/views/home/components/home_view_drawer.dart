import 'package:flutter/material.dart';

class HomeViewDrawer extends StatelessWidget {
  const HomeViewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: scheme.secondary,
      child: ListView(
        children: const [
          ListTile(title: Text('salamaa')),
          ListTile(title: Text('salamaa')),
          ListTile(title: Text('salamaa')),
          ListTile(title: Text('salamaa')),
        ],
      ),
    );
  }
}
