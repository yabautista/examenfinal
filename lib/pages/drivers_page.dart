import 'package:flutter/cupertino.dart';

class DriversPage extends StatelessWidget {
  const DriversPage({super.key});

  @override
  Widget build(BuildContext context) {
    // comentario 1: final drivers = ref.watch(getDrivers);
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Drivers"),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
            child: Center(
          child: Text("drivers_page.dart"),
        )
            // comentario 2:
            // drivers.when(
            //     data: (drivers) {
            //       if (drivers == null) {
            //         return const Center(
            //           child: Text("No drivers found"),
            //         );
            //       }
            //       return Column(
            //           children: drivers.content
            //               .map((driver) => TileDriver(
            //                     imgUrlDriver: driver.images[0].url,
            //                     nameDriver: driver.title,
            //                     imgUrlFlagCountry: driver.country.flag[0].url,
            //                     roleDriver: driver.type.name,
            //                     team: driver.team.name,
            //                     car: driver.car.name,
            //                   ))
            //               .toList(),
            //         );
            //     },
            //     error: (_, __) => const Center(child: Text("Error")),
            //     loading: () => const Center(
            //           child: CupertinoActivityIndicator(),
            //         )),
            ),
      ),
    );
  }
}
