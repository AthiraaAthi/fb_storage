import 'package:flutter/material.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget(
      {super.key,
      required this.title,
      this.onEditPressed,
      this.onDeletePressed});
  final String title;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: onEditPressed, icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: onDeletePressed, icon: Icon(Icons.delete)),
              ],
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 182, 251),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
