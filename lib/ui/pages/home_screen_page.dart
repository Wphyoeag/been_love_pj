import 'package:been_love_app/provider/chg_title_provider.dart';
import 'package:been_love_app/provider/chg_wallpaper_provider.dart';
import 'package:been_love_app/provider/date_picker_provider.dart';
import 'package:been_love_app/provider/get_img_provider.dart';
import 'package:been_love_app/provider/get_nickname_provider.dart';
import 'package:been_love_app/widget/chg_nn_dialog.dart';
import 'package:been_love_app/widget/choose_cam_gal.dart';
import 'package:been_love_app/widget/dialog_on_heart_shape.dart';
import 'package:been_love_app/widget/fav_animation.dart';
import 'package:been_love_app/widget/heart_clipper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final imageProviderOne = ref.watch(providerImgOne);
    final imageProviderTwo = ref.watch(providerImgTwo);
    final chg_nn_provider = ref.watch(nn_provider);
    final dayDiffer = ref.watch(datePickerProvider);
    final chg_tt_provider = ref.watch(chg_title_provider);
    final wallpaperProvider = ref.watch(chgWallpaperProvider);

    void showDialoggOne(BuildContext context) {
      showDialog(
          context: context,
          builder: (_) {
            return Dialog(
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: SizedBox(
                height: 120,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (_) {
                                return ChooseCamGal(
                                  onTapImg: () {
                                    Navigator.of(context).pop();
                                    ref.read(providerImgOne.notifier).gallery =
                                        true;
                                    ref
                                        .read(providerImgOne.notifier)
                                        .getImagePickerOne();
                                  },
                                  onTapCam: () {
                                    Navigator.of(context).pop();
                                    ref.read(providerImgOne.notifier).gallery =
                                        false;
                                    ref
                                        .read(providerImgOne.notifier)
                                        .getImagePickerOne();
                                  },
                                );
                              });
                        },
                        child: Text(
                          "Change profile image",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (_) {
                                return ChgNnDialog();
                              });
                        },
                        child: Text(
                          "Change nickname",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    void showDialoggTwo(BuildContext context) {
      showDialog(
          context: context,
          builder: (_) {
            return Dialog(
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: SizedBox(
                height: 120,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (_) {
                                return ChooseCamGal(
                                  onTapImg: () {
                                    Navigator.of(context).pop();
                                    ref.read(providerImgTwo.notifier).gallery =
                                        true;
                                    ref
                                        .read(providerImgTwo.notifier)
                                        .getImagePickerTwo();
                                  },
                                  onTapCam: () {
                                    Navigator.of(context).pop();
                                    ref.read(providerImgTwo.notifier).gallery =
                                        false;
                                    ref
                                        .read(providerImgTwo.notifier)
                                        .getImagePickerTwo();
                                  },
                                );
                              });
                        },
                        child: Text(
                          "Change profile image",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (_) {
                                return ChgNnDialog();
                              });
                        },
                        child: Text(
                          "Change nickname",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    // useEffect(() {
    //   ref.read(provider.notifier).getImageOneFromHive();
    //   ref.read(provider.notifier).getImageTwoFromHive();
    //   return null;
    // }, []);
    // useEffect(() {
    //   // Listen for app lifecycle changes
    //   // final appLifecycleState = WidgetsBinding.instance.lifecycleState;
    //   final observer = () {
    //     if (WidgetsBinding.instance.lifecycleState ==
    //         AppLifecycleState.resumed) {
    //       print('lifecyclechanges');
    //       ref.read(providerImgOne.notifier).getImageOneFromHive();
    //       ref.read(providerImgTwo.notifier).getImageTwoFromHive();
    //     } else {
    //       return;
    //     }
    //   };

    //   WidgetsBinding.instance.addObserver(LifecycleEventHandler(observer));
    //   // print(observer);

    //   return null;
    //   // () {
    //   //   WidgetsBinding.instance.removeObserver(LifecycleEventHandler(observer));
    //   // };
    // }, const []);
    Future<bool> showExitConfirmationDialog(BuildContext context) async {
      return await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Confirm Exit'),
              content: Text('Do you really want to exit the app?'),
              actions: <Widget>[
                TextButton(
                  child: Text('No'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                TextButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).canPop()) {
          return true;
        } else {
          return await showExitConfirmationDialog(context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: wallpaperProvider.wallpaperImgFile != null
                        ? FileImage(wallpaperProvider.wallpaperImgFile!)
                            as ImageProvider
                        : wallpaperProvider.wallpaperImage != null
                            ? AssetImage(wallpaperProvider.wallpaperImage!)
                            : AssetImage('assets/images/bae.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            'Been Love Memory',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Stack(
                          children: [
                            CustomPaint(
                              size: Size(250, 300),
                              painter: MyPainter(
                                  // Colors.blue[100] ?? Colors.blue,
                                  Colors.pink,
                                  4),
                            ),
                            ClipPath(
                              clipper: HeartClipper(),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => DialogOnHeartShape());
                                },
                                child: WaveWidget(
                                  config: CustomConfig(
                                    durations: [3000, 3000],
                                    heightPercentages: [
                                      ((100 - dayDiffer.waveHeight) / 100) -
                                          0.01,
                                      (100 - dayDiffer.waveHeight) / 100
                                    ],
                                    colors: [
                                      Colors.pink[50] ?? Colors.pink,
                                      Colors.pink,
                                    ],
                                  ),
                                  waveAmplitude: 15,
                                  size: Size(250, 300),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 120,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  Text(
                                    chg_tt_provider.topTitle,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    '${dayDiffer.dayDifference.toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    chg_tt_provider.botTitle,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // ref.read(provider.notifier).nnOne = true;
                                  ref.read(nn_provider.notifier).nnOne = true;
                                  showDialoggOne(context);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    imageProviderOne.cropImageOne != null
                                        ? Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              radius: 45,
                                              backgroundImage: FileImage(
                                                  imageProviderOne
                                                      .cropImageOne!),
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                                radius: 45,
                                                backgroundImage: AssetImage(
                                                    'assets/images/wpa.jpg')),
                                          ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      chg_nn_provider.name_one,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Text(
                              //   chg_nn_provider.name_one,
                              //   style: TextStyle(color: Colors.white),
                              // ),
                            ],
                          ),
                          FavoriteAnimation(),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // ref.read(provider.notifier).nnOne = false;
                                  ref.read(nn_provider.notifier).nnOne = false;

                                  showDialoggTwo(context);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    imageProviderTwo.cropImageTwo != null
                                        ? Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              radius: 45,
                                              backgroundImage: FileImage(
                                                  imageProviderTwo
                                                      .cropImageTwo!),
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              radius: 45,
                                              backgroundImage: AssetImage(
                                                  'assets/images/kkk.jpg'),
                                            ),
                                          ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      chg_nn_provider.name_two,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Text(
                              //   chg_nn_provider.name_two,
                              //   style: TextStyle(color: Colors.white),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class LifecycleEventHandler extends WidgetsBindingObserver {
//   final VoidCallback onResume;

//   LifecycleEventHandler(this.onResume);

//   @override
//   Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
//     if (state == AppLifecycleState.resumed) {
//       onResume();
//     }
//   }
// }

