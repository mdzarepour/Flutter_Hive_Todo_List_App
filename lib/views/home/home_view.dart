import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hive_todo/extentions/space_exs.dart';
import 'package:hive_todo/views/home/components/home_view_appbar.dart';
import 'package:hive_todo/views/home/components/home_view_drawer.dart';
import 'package:hive_todo/views/home/components/home_view_fab.dart';
import 'package:hive_todo/views/home/widgets/home_view_task_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List list = [22, 23, 24];
  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const HomeViewAppbarState(),
      drawer: const HomeViewDrawer(),
      body: _buildHomeViewBody(scheme, textTheme),
      floatingActionButton: homeViewFab(),
    );
  }

  SafeArea _buildHomeViewBody(ColorScheme scheme, TextTheme textTheme) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          20.h,
          // header -->
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: 1 / 3,
                backgroundColor: scheme.primaryContainer,
                valueColor: AlwaysStoppedAnimation(scheme.onSurface),
              ),
              30.w,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(style: textTheme.headlineLarge, 'My Tasks'),
                  10.h,
                  Text(style: textTheme.titleMedium, '1 of 3 tasks'),
                ],
              ),
            ],
          ),
          10.h,
          const Divider(),
          30.h,
          // tasks listview -->
          Expanded(
            child: list.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInUp(
                        from: 30,
                        child: LottieBuilder.asset(
                          animate: list.isEmpty ? true : false,
                          height: 200,
                          'assets/empty_box.json',
                        ),
                      ),
                      FadeInUp(
                        from: 30,
                        child: Text(
                          style: textTheme.headlineMedium,
                          'You Done All Tasks',
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        background: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(Iconsax.trash, color: scheme.primaryContainer),
                            Text(
                              style: textTheme.titleMedium,
                              'This Task Was deleted',
                            ),
                          ],
                        ),
                        onDismissed: (_) {
                          setState(() {
                            list.removeAt(index);
                          });
                        },
                        direction: DismissDirection.horizontal,
                        key: Key(list[index].toString()),
                        child: const HomeViewTaskWidget(),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
