import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movil_wrc_app/pages/routes/routes.dart';

class CreateProduct extends ConsumerWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController unitPriceController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController presentationController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Conductor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ingresar Conductor ',
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nombres',
                  hintText: 'Ingrese el # de carrera',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextFormField(
                controller: unitPriceController,
                decoration: InputDecoration(
                  labelText: 'Apuestas',
                  hintText: 'Nombres',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () async {
                  var nameProvider;
                  ref
                      .read(nameProvider.notifier)
                      .update((state) => state = nameController.text);
                  var unitPriceProvider;
                  ref
                      .read(unitPriceProvider.notifier)
                      .update((state) => state = unitPriceController.text);
                  var descriptionProvider;
                  ref
                      .read(descriptionProvider.notifier)
                      .update((state) => state = descriptionController.text);
                  var presentationProvider;
                  ref
                      .read(presentationProvider.notifier)
                      .update((state) => state = presentationController.text);

                  final resp = await ref.read(Provider.future);
                  final msg = "Nombre Agregado: " + resp["data"]["name"];
                  Fluttertoast.showToast(
                      msg: msg.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: const Color.fromARGB(255, 175, 76, 130),
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: const Text('Agregar'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 175, 76, 109)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () async {
                  ref.read(routerProvider).go(RoutesNames.dashboard);
                },
                child: const Text('Regresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Fluttertoast {}
