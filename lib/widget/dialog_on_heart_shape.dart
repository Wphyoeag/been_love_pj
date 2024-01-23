import 'package:been_love_app/provider/chg_title_provider.dart';
import 'package:been_love_app/provider/date_picker_provider.dart';
import 'package:been_love_app/ui/pages/wallpaper_choice_page.dart';
import 'package:been_love_app/widget/change_title_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogOnHeartShape extends ConsumerWidget {
  const DialogOnHeartShape({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: SizedBox(
        width: 200,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    ref.read(chg_title_provider.notifier).topTitleBool = true;
                    showDialog(
                        context: context, builder: (_) => ChgTitleDialog());
                  },
                  child: Text(
                    'Change top title',
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      ref
                          .read(datePickerProvider.notifier)
                          .pickDateFromCalendar(context);
                    },
                    child: Text('Change date')),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      ref.read(chg_title_provider.notifier).topTitleBool =
                          false;
                      showDialog(
                          context: context, builder: (_) => ChgTitleDialog());
                    },
                    child: Text('Change bottom title')),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => WallpaperChoicPage()));
                    },
                    child: Text('Change wallpaper'))
              ]),
        ),
      ),
    );
  }
}
