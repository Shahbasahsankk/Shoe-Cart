import 'package:e_commerce_app/controller/profile/profile_controller.dart';
import 'package:e_commerce_app/view/profile/model/profile_sections_model.dart';
import 'package:e_commerce_app/widgets/navigator_key_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileSectionItems {
  final ProfileProvider profileProvider = Provider.of<ProfileProvider>(
      NavigationService.navigatorKey.currentContext!,
      listen: false);
  final List<ProfileSectionModel> profileSectionList = [
    ProfileSectionModel(
      leadingIcon: Icons.notifications,
      title: 'Notifications',
      ontap: () => (NavigationService.navigatorKey.currentContext!)
          .read<ProfileProvider>()
          .goToNotificationSettings(),
    ),
    ProfileSectionModel(
      leadingIcon: Icons.location_on,
      title: 'Saved Addresses',
      ontap: () => (NavigationService.navigatorKey.currentContext!)
          .read<ProfileProvider>()
          .goToAddressPage(),
    ),
    ProfileSectionModel(
      leadingIcon: Icons.developer_board,
      title: 'About',
      ontap: () => (NavigationService.navigatorKey.currentContext!)
          .read<ProfileProvider>()
          .aboutApp(),
    )
  ];
}
