import 'package:e_commerce_app/controller/profile/profile_controller.dart';
import 'package:e_commerce_app/helper/colors/app_colors.dart';
import 'package:e_commerce_app/helper/sizedboxes/app_sizedboxes.dart';
import 'package:e_commerce_app/view/profile/widgets/profile_section_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/loading_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
        ),
        body: Consumer<ProfileProvider>(
          builder: (context, values, _) {
            return values.loading == true
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    width: double.infinity,
                    child: const Center(
                      child: LoadingWidget(),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: ProfileSectionItems()
                                  .profileSectionList[index]
                                  .ontap,
                              title: Text(ProfileSectionItems()
                                  .profileSectionList[index]
                                  .title),
                              leading: Icon(ProfileSectionItems()
                                  .profileSectionList[index]
                                  .leadingIcon),
                              trailing: GestureDetector(
                                onTap: ProfileSectionItems()
                                    .profileSectionList[index]
                                    .ontap,
                                child: const Icon(Icons.chevron_right_sharp),
                              ),
                            );
                          },
                          itemCount: 3,
                        ),
                      ),
                      AppSizedBoxes.sizedboxH20,
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: GestureDetector(
                          onTap: () => values.logOut(context),
                          child: Container(
                            color: AppColors.whiteColor38,
                            height: 40,
                            child: const Center(
                              child: Text(
                                'Log out',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
