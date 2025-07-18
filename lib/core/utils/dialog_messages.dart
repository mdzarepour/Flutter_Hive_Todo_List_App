import 'package:flutter/material.dart';
import 'package:hive_todo/core/constants/app_colors.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/extentions/space_exs.dart';

dynamic showEmptyTaskListWarningDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        title: const Text(AppStrings.dialogOops),
        content: const Text(
          style: TextStyle(color: AppColors.materialWhite),
          AppStrings.dialogDeteleTask,
        ),
        actions: [
          10.h,
          Center(
            child: SizedBox(
              width: 200,
              child: FilledButton(
                onPressed: () {},
                child: const Text(AppStrings.dialogOk),
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
        title: const Text(AppStrings.dialogAreSure),
        content: const Text(
          style: TextStyle(color: AppColors.materialWhite),
          AppStrings.dialogDeteleTask,
        ),
        actions: [
          10.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () {},
                child: const Text(AppStrings.dialogDelete),
              ),
              20.w,
              FilledButton(
                onPressed: () {},
                child: const Text(AppStrings.dialogCancle),
              ),
            ],
          ),
        ],
      );
    },
  );
}
