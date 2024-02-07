import 'package:flutter/cupertino.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Dashboard"),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: CupertinoListSection(
          header: const Text("List of options:"),
          children: [
            CupertinoListTile(
              title: const Text("Drivers"),
              leading: const Icon(CupertinoIcons.person_2_fill),
              trailing: const Icon(CupertinoIcons.right_chevron),
              onTap: (){
                //comentario 1: implementar ruta con riverpod
              },
            ),
            CupertinoListTile(
              title: const Text("Calendar"),
              leading: const Icon(CupertinoIcons.calendar),
              trailing: const Icon(CupertinoIcons.right_chevron),
              onTap: () {
                //comentario 2: implementar ruta con riverpod
              },
            ),
          ],
        ),
      ),
    );
  }
}
