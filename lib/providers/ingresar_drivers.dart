import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movil_pucetec_api/configs/shared_prefs.dart';

final idProvider = StateProvider<String>((ref) => '');
final nameProvider = StateProvider<String>((ref) => '');
final unitPriceProvider = StateProvider<String>((ref) => '');
final descriptionProvider = StateProvider<String>((ref) => '');
final presentationProvider = StateProvider<String>((ref) => '');
final categoryProvider = StateProvider<String>((ref) => '');
final dioProvider = Provider<Dio>((ref) => Dio());
final createProductsProvider =
    FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
  final dio = ref.watch(dioProvider);
  final String unitPriceString = ref.watch(unitPriceProvider);
  try {
    final double unitPrice = double.parse(unitPriceString);

    final response = await dio.post(
      'https://api.wrc.com/content/filters/calendar?championship=wrc&origin=vcms&year=2024',
      options: Options(
        validateStatus: (status) => status! < 500,
        headers: {
          "Authorization": "Bearer ${SharedPrefs.prefs.getString('token')}"
        },
      ),
      data: {
        "name": ref.watch(nameProvider),
        "unitPrice": unitPrice,
        "description": ref.watch(descriptionProvider),
        "presentation": ref.watch(presentationProvider),
        "category": "656f9b7b8e9e07c4d066c196"
      },
    );

    if (response.statusCode == 201) {
      return <String, dynamic>{
        "data": response.data,
        "status": response.statusCode,
      };
    } else {
      return <String, dynamic>{
        "data": response.data,
        "status": response.statusCode,
      };
    }
  } catch (error) {
    return <String, dynamic>{
      "data": null,
      "status": 400,
    };
  }
});
