import 'package:been_love_app/provider/get_nickname_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChgNnDialog extends ConsumerWidget {
  const ChgNnDialog({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final TextEditingController controller = TextEditingController();
    final chg_nn_provider = ref.watch(nn_provider);
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
                controller: chg_nn_provider.nnOne
                    ? (controller..text = chg_nn_provider.name_one)
                    : (controller..text = chg_nn_provider.name_two),
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
                          .read(nn_provider.notifier)
                          .updateNickmame(controller.text, controller.text);
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
