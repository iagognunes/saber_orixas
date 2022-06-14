import 'package:get/get.dart';
import 'package:saber_orixas/models/centro_model.dart';

class CentroController extends GetxController {
  var centro = CentroModel(number: 0).obs;
  var orixaCentro = CentroOrixaModel(orixa: '').obs;

  void updateNumber(int newValue) =>
      centro.value.number = centro.value.number + newValue;

  void deleteNumber() => centro.value.number = 0;

  void updateOrixa(newOrixa) => orixaCentro.value.orixa = newOrixa;
}
