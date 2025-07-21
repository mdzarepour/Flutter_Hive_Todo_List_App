import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/data/hive_data.dart';
import 'package:hive_todo/extentions/space_exs.dart';
import 'package:hive_todo/main.dart';
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
  late HiveData _hiveData;

  @override
  Widget build(BuildContext context) {
    _hiveData = BaseWidget.of(context).hiveData;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: HomeViewAppbar(hiveDate: _hiveData),
      drawer: const HomeViewDrawer(),
      body: _buildHomeViewBody(colorScheme, textTheme),
      floatingActionButton: const HomeViewFab(),
    );
  }

  SafeArea _buildHomeViewBody(ColorScheme colorScheme, TextTheme textTheme) {
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: _hiveData.listenToBox(),
        builder: (context, value, child) {
          final List<int> taskListStats = _hiveData.readTaskListStats();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              20.h,
              _buildHeader(taskListStats, colorScheme, textTheme),
              10.h,
              const Divider(),
              30.h,
              Expanded(
                child: _hiveData.taskBox.isEmpty
                    ? _buildEmptyStateWidget(textTheme)
                    : _buildTaskListView(colorScheme, textTheme),
              ),
            ],
          );
        },
      ),
    );
  }

  ListView _buildTaskListView(ColorScheme colorScheme, TextTheme textTheme) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _hiveData.taskBox.values.length,
      itemBuilder: (context, index) {
        final taskList = _hiveData.taskBox.values.toList();
        return Dismissible(
          background: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Iconsax.trash, color: colorScheme.primaryContainer),
              10.w,
              Text(AppStr.homeViewDelete, style: textTheme.titleMedium),
            ],
          ),
          onDismissed: (_) => _hiveData.deleteTask(task: taskList[index]),
          direction: DismissDirection.horizontal,
          key: Key(taskList[index].id),
          child: HomeViewTaskWidget(task: taskList[index]),
        );
      },
    );
  }

  Column _buildEmptyStateWidget(TextTheme textTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInUp(
          from: 30,
          child: LottieBuilder.asset(
            animate: _hiveData.taskBox.isEmpty,
            height: 200,
            AppStr.homeViewEmptyJson,
          ),
        ),
        FadeInUp(
          from: 30,
          child: Text(AppStr.homeViewEmpty, style: textTheme.headlineMedium),
        ),
      ],
    );
  }

  Row _buildHeader(
    List taskListStats,
    ColorScheme scheme,
    TextTheme textTheme,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          value: _hiveData.taskBox.isEmpty
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
            Text(AppStr.homeViewMyTasks, style: textTheme.headlineLarge),
            10.h,
            Text(
              '${taskListStats[0]} of ${taskListStats[1]}',
              style: textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
