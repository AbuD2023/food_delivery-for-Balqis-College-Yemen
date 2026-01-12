import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/constants/app_them.dart';
import 'package:food_delivery/features/auth/presentaion/page/login_page.dart';
import 'package:food_delivery/features/home/presentaion/page/home_page.dart';

import '../../features/auth/presentaion/state/auth_state.dart'
    show getUserProvider, loginProvider, signOutProvider;
import '../../features/home/presentaion/widgets/home_header.dart';
import '../../gen/assets.gen.dart';

class CustomDrawer extends ConsumerStatefulWidget {
  const CustomDrawer({super.key});

  @override
  ConsumerState<CustomDrawer> createState() => _State();
}

class _State extends ConsumerState<CustomDrawer> {
  TextStyle boldTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  List<SampleListModel> getData = [];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  double angle = 0;

  bool d1Open = false;

  late int isSelected = 0;

  closeDrawer() {
    xOffset = 0;
    yOffset = 0;
    angle = 0;
    scaleFactor = 1;
    d1Open = false;
    setStatusBarColor(AppTheme.accent);
  }

  openDrawer() {
    xOffset = 200;
    yOffset = 80;
    scaleFactor = 0.8;
    angle = 6.18;
    d1Open = true;
    setStatusBarColor(AppTheme.accent);
    setState(() {});
  }

  @override
  void initState() {
    setStatusBarColor(AppTheme.accent);
    super.initState();
    getData.add(
      SampleListModel(
        title: "Home",
        icon: Icons.home,
        launchWidget: const HomePage(),
        isPage: true,
      ),
    );
    getData.add(
      SampleListModel(
        title: "Payment",
        icon: Icons.payment,
        launchWidget: Center(child: Text("Payment View", style: boldTextStyle)),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Promo",
        icon: Icons.card_giftcard,
        launchWidget: Center(child: Text("Promo View", style: boldTextStyle)),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Notification",
        icon: Icons.notifications_none,
        launchWidget: Center(
          child: Text("Notification View", style: boldTextStyle),
        ),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Help",
        icon: Icons.help_outline_outlined,
        launchWidget: Center(child: Text("Help View", style: boldTextStyle)),
      ),
    );
    getData.add(
      SampleListModel(
        title: "About Us",
        icon: Icons.info_outline,
        launchWidget: Center(
          child: Text("About Us View", style: boldTextStyle),
        ),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Rate Us",
        icon: Icons.star_border,
        launchWidget: Center(child: Text("Rate Us View", style: boldTextStyle)),
      ),
    );
    // init();
  }

  // void init() async {
  //   await Future.delayed(Duration(seconds: 1)).then((value) => openDrawer());
  // }

  @override
  void dispose() {
    setStatusBarColor(AppTheme.accent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(loginProvider);
    final signInnotifier = ref.watch(loginProvider.notifier);
    final signOutState = ref.watch(signOutProvider.notifier);
    final getUserState = ref.watch(getUserProvider);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: AppTheme.accent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        SizedBox(height: 40),

                        getUserState.when(
                          data: (data) => Column(
                            children: [
                              data.profileImage == null ||
                                      data.profileImage!.isEmpty
                                  ? Icon(
                                      Icons.account_circle,
                                      color: Colors.white,
                                      size: 70,
                                    )
                                  : ClipOval(
                                      child: Image.network(
                                        data.profileImage!,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Container(
                                            width: 80,
                                            height: 80,
                                            color: Colors.white
                                              ..withAlpha((0.2 * 255).toInt()),
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                    : null,
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                width: 80,
                                                height: 80,
                                                color: Colors.white.withAlpha(
                                                  (0.2 * 255).toInt(),
                                                ),
                                                child: Icon(
                                                  Icons.account_circle,
                                                  color: Colors.white,
                                                  size: 70,
                                                ),
                                              );
                                            },
                                      ),
                                    ),
                              SizedBox(height: 8),
                              Text(
                                data.firstName.isNotEmpty
                                    ? data.firstName
                                    : 'Guest User',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data.email.isNotEmpty
                                    ? data.email
                                    : 'Guest User',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          error: (error, stackTrace) {
                            return Text(error.toString());
                          },
                          loading: () =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      ...List.generate(getData.length, (index) {
                        SampleListModel data = getData[index];
                        return ListTile(
                          tileColor: isSelected == index
                              ? Color.fromARGB(255, 0, 0, 0)
                              : Colors.transparent,
                          title: Text(
                            data.title ?? "",
                            style: TextStyle(
                              color: isSelected == index
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          ),
                          leading: Icon(
                            data.icon,
                            color: isSelected == index
                                ? Colors.white
                                : Colors.white70,
                          ),
                          onTap: () {
                            isSelected = index;
                            closeDrawer();
                            setState(() {});
                          },
                        );
                      }),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 24),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      onTap: () async {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Center(child: CircularProgressIndicator()),
                          ),
                        );
                        final loginId = signInState.value!.id;
                        log(loginId.toString(), name: 'loginId');
                        log(signInState.value!.email.toString(), name: 'email');
                        // Call sign in
                        await signOutState.signOut(loginId);

                        // Close loading dialog
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }

                        // Check result and navigate
                        final result = ref.read(signOutProvider);
                        result.when(
                          data: (data) {
                            if (context.mounted && data == true) {
                              signInnotifier.clear();
                              log(loginId.toString(), name: 'clear=> loginId');
                              log(
                                signInState.value!.email.toString(),
                                name: 'clear=> email',
                              );
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                                (route) => false,
                              );
                            } else if (data == false) {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => const AlertDialog(
                                  title: Center(
                                    child: Text('لم يتم تسجيل الخروج :('),
                                  ),
                                ),
                              );
                            }
                            // closeDrawer();
                            // setState(() {});
                          },
                          loading: () {},
                          error: (error, stackTrace) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error: $error'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                closeDrawer();
                setState(() {});
              },
              onPanUpdate: (d) {
                closeDrawer();
                setState(() {});
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: d1Open
                      ? BorderRadius.circular(16)
                      : BorderRadius.circular(0),
                ),
                transform: Matrix4.translationValues(xOffset, yOffset, 0)
                  ..scaleByDouble(
                    scaleFactor,
                    scaleFactor,
                    1.0,
                    1.0,
                  ) // ✅ الحل هنا
                  ..rotateZ(angle),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    HomeHeader(
                      hamburgerMenu: GestureDetector(
                        onTap: () {
                          if (d1Open) {
                            closeDrawer();
                          } else {
                            xOffset = 200;
                            yOffset = 80;
                            scaleFactor = 0.8;
                            angle = 6.18;
                            d1Open = true;
                            setStatusBarColor(AppTheme.accent);
                          }
                          setState(() {});
                        },
                        child: d1Open
                            ? const Icon(Icons.arrow_back, size: 24)
                            : Image.asset(
                                Assets.icons.drawer.path,
                                width: 24,
                                height: 24,
                              ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!getData[isSelected].isPage) ...[
                              getData[isSelected].launchWidget ?? Container(),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                        AppTheme.shadow,
                                      ),
                                  padding: WidgetStateProperty.all(
                                    const EdgeInsets.symmetric(horizontal: 15),
                                  ),
                                  shadowColor: WidgetStateProperty.all(
                                    Colors.transparent,
                                  ),
                                ),
                                onPressed: () {
                                  openDrawer();
                                },
                                child: const Text(
                                  'Go Back',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ] else ...[
                              Expanded(
                                child:
                                    getData[isSelected].launchWidget ??
                                    Container(),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // AnimatedContainer(
              //   duration: Duration(milliseconds: 200),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: d1Open
              //         ? BorderRadius.circular(16)
              //         : BorderRadius.circular(0),
              //   ),
              //   // transform: Matrix4.translationValues(xOffset, yOffset, 0)
              //   //   ..scale(scaleFactor)
              //   //   ..rotateZ(angle),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       HomeHeader(
              //         hamburgerMenu: GestureDetector(
              //           onTap: () {
              //             // Scaffold.of(context).openDrawer();
              //             if (d1Open) {
              //               closeDrawer();
              //             } else {
              //               xOffset = 200;
              //               yOffset = 80;
              //               scaleFactor = 0.8;
              //               angle = 6.18;
              //               d1Open = true;
              //               setStatusBarColor(AppTheme.accent);
              //             }
              //             setState(() {});
              //           },
              //           child: d1Open
              //               ? Icon(Icons.arrow_back, size: 24)
              //               : Image.asset(
              //                   Assets.icons.drawer.path,
              //                   width: 24,
              //                   height: 24,
              //                 ),
              //         ),
              //       ),

              //       Expanded(
              //         child: Container(
              //           alignment: Alignment.center,
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               if (!getData[isSelected].isPage) ...[
              //                 getData[isSelected].launchWidget ?? Container(),
              //                 SizedBox(height: 16),
              //                 ElevatedButton(
              //                   style: ButtonStyle(
              //                     backgroundColor:
              //                         WidgetStateProperty.all<Color>(
              //                           AppTheme.shadow,
              //                         ),
              //                     padding: WidgetStateProperty.all(
              //                       const EdgeInsets.only(left: 15, right: 15),
              //                     ),
              //                     shadowColor: WidgetStateProperty.all(
              //                       Colors.transparent,
              //                     ),
              //                   ),

              //                   onPressed: () {
              //                     openDrawer();
              //                     // Navigator.pop(context);
              //                   },
              //                   child: Text(
              //                     'Go Back',
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                 ),
              //               ] else ...[
              //                 Expanded(
              //                   child:
              //                       getData[isSelected].launchWidget ??
              //                       Container(),
              //                 ),
              //               ],
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  //change status bar color
  Future<void> setStatusBarColor(
    Color statusBarColor, {
    Color? systemNavigationBarColor,
    Brightness? statusBarBrightness,
    Brightness? statusBarIconBrightness,
    int delayInMilliSeconds = 200,
  }) async {
    await Future.delayed(Duration(milliseconds: delayInMilliSeconds));

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        systemNavigationBarColor: systemNavigationBarColor,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.light,
      ),
    );
  }
}

class SampleListModel {
  Widget? leading;
  String? title;
  String? subTitle;
  Widget? trailing;
  IconData? icon;
  IconData? alternateIcon;
  Function? onTap;
  Color? colors;
  Widget? launchWidget;
  bool isPage;

  SampleListModel({
    this.leading,
    this.title,
    this.subTitle,
    this.colors,
    this.icon,
    this.alternateIcon,
    this.trailing,
    this.onTap,
    this.launchWidget,
    this.isPage = false,
  });
}

AppTheme appTheme = AppTheme();
