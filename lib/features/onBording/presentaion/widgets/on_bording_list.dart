import 'package:flutter/material.dart';

import '../../domain/entities/on_bording.dart';
import 'on_bording_content.dart';
import 'on_bording_hedar.dart';

class OnBordingList extends StatelessWidget {
  const OnBordingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: onBordingList.length,
        child: Builder(
          builder: (context) {
            final tabController = DefaultTabController.of(context);
            return TabBarView(
              // physics: const NeverScrollableScrollPhysics(), // منع السحب
              children: onBordingList.map((onBording) {
                int currentIndex = onBordingList.indexOf(onBording);
                return Stack(
                  children: [
                    Column(
                      children: [
                        OnBordingHedar(
                          imageSrc: onBording.imageSrc,
                          height: 10,
                          width: MediaQuery.of(context).size.width - 30,
                        ),
                        Flexible(
                          child: OnBordingContent(
                            title: onBording.title,
                            subTitle: onBording.subTitle,
                            onPressed: () {
                              if (currentIndex < onBordingList.length - 1) {
                                tabController.animateTo(currentIndex + 1);
                              } else {
                                // آخر صفحة → قم بعمل حدث معين
                                print(
                                  "تم الوصول لآخر صفحة. تنفيذ حدث معين هنا",
                                );
                              }
                            },

                            buttonText: 'Let’s Continue',
                          ),
                        ),
                      ],
                    ),
                    if (currentIndex == onBordingList.length - 1)
                      Positioned(
                        top: 50,
                        child: IconButton(
                          onPressed: () {
                            if (currentIndex == onBordingList.length - 1) {
                              tabController.animateTo(currentIndex - 1);
                            } else {
                              // آخر صفحة → قم بعمل حدث معين
                              print("تم الوصول لآخر صفحة. تنفيذ حدث معين هنا");
                            }
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                    if (currentIndex < onBordingList.length - 1)
                      Positioned(
                        top: 50,
                        right: 15,
                        child: IconButton(
                          onPressed: () {
                            if (currentIndex < onBordingList.length - 1) {
                              tabController.animateTo(onBordingList.length - 1);
                            } else {
                              // آخر صفحة → قم بعمل حدث معين
                              print("تم الوصول لآخر صفحة. تنفيذ حدث معين هنا");
                            }
                          },
                          icon: Text('Skip'),
                        ),
                      ),
                  ],
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
