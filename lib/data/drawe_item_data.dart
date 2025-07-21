import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/models/drawe_item_model.dart';
import 'package:iconsax/iconsax.dart';

class DraweItemData {
  List<DraweItemModel> drawerItems = [
    DraweItemModel(icon: Iconsax.user, index: 0, title: AppStr.drawerProfile),
    DraweItemModel(icon: Iconsax.home_1, index: 1, title: AppStr.drawerHome),
    DraweItemModel(
      icon: Iconsax.setting,
      index: 2,
      title: AppStr.drawerSetting,
    ),
    DraweItemModel(icon: Iconsax.send_1, index: 3, title: AppStr.drawerShare),
  ];
}
