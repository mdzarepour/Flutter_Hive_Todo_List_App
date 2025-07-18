import 'package:flutter/material.dart';
import 'package:hive_todo/core/constants/app_colors.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/main.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

dynamic emptyTaskListWarningDialog(BuildContext context) {
  return PanaraInfoDialog.showAnimatedFade(
    context,
    message: AppStrings.dialogEmptyTask,
    title: AppStrings.dialogOops,
    buttonText: AppStrings.dialogOk,
    onTapDismiss: () {
      // BaseWidget.of(context).hiveData.taskBox.clear();
      Navigator.of(context).pop();
    },
    panaraDialogType: PanaraDialogType.custom,
    color: const Color.fromARGB(150, 255, 255, 255),
    textColor: const Color.fromARGB(150, 255, 255, 255),
    buttonTextColor: AppColors.materialBlack,
  );
}

dynamic taskDeletingDialog(BuildContext context) {
  return PanaraConfirmDialog.showAnimatedFade(
    context,
    message: AppStrings.dialogDeteleTask,
    title: AppStrings.dialogAreSure,
    panaraDialogType: PanaraDialogType.custom,
    color: const Color.fromARGB(150, 255, 255, 255),
    textColor: const Color.fromARGB(150, 255, 255, 255),
    buttonTextColor: AppColors.materialFirstBlue,
    confirmButtonText: AppStrings.dialogDelete,
    cancelButtonText: AppStrings.dialogCancle,
    onTapConfirm: () {
      print('task deleted test');
      Navigator.pop(context);
    },
    onTapCancel: () {
      Navigator.pop(context);
    },
  );
}
