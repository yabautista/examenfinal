import 'package:flutter/cupertino.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    //cometario 1: final calendar = ref.watch(getCalendar);
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Calendar"),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Center(
            // comentario 2: implementar la lista de carreras con el widget TileCalendar
            child: Text("No se debe ver este texto"),
          ),
        ),
      ),
    );
  }
}
