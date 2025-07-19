import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/data/hive_data.dart';
import 'package:hive_todo/extentions/space_exs.dart';
import 'package:hive_todo/main.dart';
import 'package:hive_todo/models/task_model.dart';
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
  late HiveData hiveData;

  @override
  Widget build(BuildContext context) {
    hiveData = BaseWidget.of(context).hiveData;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: HomeViewAppbar(hiveDate: hiveData),
      drawer: const HomeViewDrawer(),
      body: _buildHomeViewBody(scheme, textTheme),
      floatingActionButton: const HomeViewFab(),
    );
  }

  SafeArea _buildHomeViewBody(ColorScheme scheme, TextTheme textTheme) {
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: hiveData.listenToBox(),
        builder: (context, value, child) {
          final List<int> taskListStats = hiveData.readTaskListStats();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              20.h,
              // header -->
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    value: hiveData.taskBox.length == 0
                        ? null
                        : taskListStats[0] / taskListStats[1],
                    backgroundColor: scheme.primaryContainer,
                    valueColor: AlwaysStoppedAnimation(scheme.onSurface),
                  ),
                  30.w,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        style: textTheme.headlineLarge,
                        AppStrings.homeViewMyTasks,
                      ),
                      10.h,
                      Text(
                        style: textTheme.titleMedium,
                        '${taskListStats[0]} of ${taskListStats[1]}',
                      ),
                    ],
                  ),
                ],
              ),
              10.h,
              const Divider(),
              30.h,
              // tasks listview -->
              Expanded(
                child: hiveData.taskBox.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeInUp(
                            from: 30,
                            child: LottieBuilder.asset(
                              animate: hiveData.taskBox.isEmpty ? true : false,
                              height: 200,
                              AppStrings.homeViewEmptyJson,
                            ),
                          ),
                          FadeInUp(
                            from: 30,
                            child: Text(
                              style: textTheme.headlineMedium,
                              AppStrings.homeViewEmpty,
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: hiveData.taskBox.values.length,
                        itemBuilder: (context, index) {
                          final taskList = hiveData.taskBox.values.toList();
                          return Dismissible(
                            background: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Icon(
                                  Iconsax.trash,
                                  color: scheme.primaryContainer,
                                ),
                                Text(
                                  style: textTheme.titleMedium,
                                  AppStrings.homeViewDelete,
                                ),
                              ],
                            ),
                            onDismissed: (_) {
                              setState(() {
                                hiveData.deleteTask(task: taskList[index]);
                              });
                            },
                            direction: DismissDirection.horizontal,
                            key: Key(taskList[index].id),
                            child: HomeViewTaskWidget(task: taskList[index]),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
