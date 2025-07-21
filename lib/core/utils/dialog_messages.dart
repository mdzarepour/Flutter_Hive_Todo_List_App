import 'package:flutter/material.dart';
import 'package:hive_todo/core/constants/app_colors.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/extentions/space_exs.dart';
import 'package:hive_todo/main.dart';

dynamic showEmptyTaskListWarningDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        title: const Text(AppStr.dialogOops),
        content: const Text(
          style: TextStyle(color: AppColors.materialWhite),
          AppStr.dialogEmptyTask,
        ),
        actions: [
          10.h,
          Center(
            child: SizedBox(
              width: 200,
              child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(AppStr.dialogOk),
              ),
            ),
          ),
          20.w,
        ],
      );
    },
  );
}

dynamic showTaskDeletingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        title: const Text(AppStr.dialogAreSure),
        content: const Text(
          style: TextStyle(color: AppColors.materialWhite),
          AppStr.dialogDeteleTask,
        ),
        actions: [
          10.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () async {
                  await BaseWidget.of(context).hiveData.deleteAllTask();
                  Navigator.pop(context);
                },
                child: const Text(AppStr.dialogDelete),
              ),
              20.w,
              FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(AppStr.dialogCancle),
              ),
            ],
          ),
        ],
      );
    },
  );
}
