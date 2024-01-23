import 'package:been_love_app/provider/chg_title_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChgTitleDialog extends ConsumerWidget {
  const ChgTitleDialog({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final TextEditingController controller = TextEditingController();
    final chg_tt_provider = ref.watch(chg_title_provider);
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: SizedBox(
        width: 100,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: chg_tt_provider.topTitleBool
                    ? (controller..text = chg_tt_provider.topTitle)
                    : (controller..text = chg_tt_provider.botTitle),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(chg_title_provider.notifier)
                          .updateTitle(controller.text, controller.text);
                      Navigator.of(context).pop();
                    },
                    child: Text("OK")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
