import 'package:flutter/material.dart';

class ChooseCamGal extends StatelessWidget {
  final void Function() onTapImg;
  final void Function() onTapCam;
  const ChooseCamGal(
      {super.key, required this.onTapImg, required this.onTapCam});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: SizedBox(
        height: 200,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Choose',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: onTapImg,
                  child: Icon(
                    Icons.image,
                    size: 100,
                  ),
                ),
                InkWell(
                  onTap: onTapCam,
                  child: Icon(
                    Icons.camera_alt,
                    size: 100,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
