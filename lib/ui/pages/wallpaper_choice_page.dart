import 'package:been_love_app/provider/chg_wallpaper_provider.dart';
import 'package:been_love_app/ui/pages/home_screen_page.dart';
import 'package:been_love_app/widget/choose_cam_gal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WallpaperChoicPage extends ConsumerWidget {
  const WallpaperChoicPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final List<String> wallpaperList = [
      'assets/images/bae.jpg',
      'assets/images/bg.jpg',
      'assets/images/img1.jpg',
      'assets/images/img2.jpg',
      'assets/images/img3.jpg',
      'assets/images/img4.jpg',
      'assets/images/img5.jpg',
      'assets/images/img6.jpg',
      'assets/images/img7.jpg',
      'assets/images/img8.jpg',
      'assets/images/img9.jpg',
      'assets/images/img10.jpg',
      'assets/images/img11.jpg',
      'assets/images/img13.jpg',
      'assets/images/img14.jpg',
      'assets/images/img15.jpg',
      'assets/images/img16.jpg',
      'assets/images/img17.jpg',
      'assets/images/img19.jpg',
      'assets/images/img20.jpg',
      'assets/images/img21.jpg',
      'assets/images/img22.jpg',
      'assets/images/img23.jpg',
    ];
    final wallpaperProvider = ref.watch(chgWallpaperProvider);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: wallpaperProvider.wallpaperImgFile != null
                    ? FileImage(wallpaperProvider.wallpaperImgFile!)
                        as ImageProvider
                    : wallpaperProvider.wallpaperImage != null
                        ? AssetImage(wallpaperProvider.wallpaperImage!)
                        : AssetImage('assets/images/bae.jpg'),
                fit: BoxFit.cover)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: wallpaperList.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: (index == 0 || index % 3 == 0)
                          ? EdgeInsets.only(
                              left: 1.4, right: 0.7, top: 0.7, bottom: 0.7)
                          : (index == 2 || (index - 2) % 3 == 0)
                              ? EdgeInsets.only(
                                  left: 0.7, right: 1.4, top: 0.7, bottom: 0.7)
                              : EdgeInsets.all(1.4),
                      child: InkWell(
                        onTap: () {
                          if (index == 0) {
                            showDialog(
                                context: context,
                                builder: (_) => ChooseCamGal(
                                      onTapImg: () async {
                                        ref
                                            .read(chgWallpaperProvider.notifier)
                                            .gallery = true;
                                        await ref
                                            .read(chgWallpaperProvider.notifier)
                                            .showImagePicker();
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        MainScreen()),
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      onTapCam: () async {
                                        ref
                                            .read(chgWallpaperProvider.notifier)
                                            .gallery = false;
                                        await ref
                                            .read(chgWallpaperProvider.notifier)
                                            .showImagePicker();
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        MainScreen()),
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                    ));
                          } else {
                            ref
                                .read(chgWallpaperProvider.notifier)
                                .storeWallpaper(wallpaperList[index]);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (_) => MainScreen()),
                                (Route<dynamic> route) => false);
                          }
                        },
                        child: Container(
                          // width: 50,
                          // height: 50,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.cyan, width: 1.5),
                              image: DecorationImage(
                                  image: AssetImage(wallpaperList[index]),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    );
                  }),
            ),
            Positioned(
                top: 35,
                child: Text(
                  'Select the wallpaper',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 173, 237, 12)),
                ))
          ],
        ),
      ),
    );
  }
}
