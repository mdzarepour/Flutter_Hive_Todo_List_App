import 'package:flutter/widgets.dart';
import 'package:ftoast/ftoast.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/core/theme/app_text_theme.dart';

dynamic addingTaskEmptyFieldsWarning(BuildContext context) {
  return FToast.toast(
    context,
    corner: 12,
    color: const Color.fromARGB(255, 35, 35, 38),
    msg: AppStrings.dialogOops,
    subMsg: AppStrings.toastPleaseInsert,
    duration: 2000,
    msgStyle: AppTextTheme.appTextTheme.headlineMedium,
  );
}

dynamic updatingTaskEmptyFieldsWarning(BuildContext context) {
  return FToast.toast(
    context,
    corner: 12,
    color: const Color.fromARGB(255, 35, 35, 38),
    msg: AppStrings.dialogOops,
    subMsg: AppStrings.toastPleaseEdit,
    duration: 2000,
    msgStyle: AppTextTheme.appTextTheme.headlineMedium,
  );
}
