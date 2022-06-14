import 'package:get/get.dart';
import 'package:saber_orixas/models/nuca_model.dart';

class NucaController extends GetxController {
  var nuca = NucaModel(number: 0).obs;
  var orixaNuca = NucaOrixaModel(orixa: '').obs;

  void updateNumber(int newValue) =>
      nuca.value.number = nuca.value.number + newValue;

  void deleteNumber() => nuca.value.number = 0;

  void updateOrixa(newOrixa) => orixaNuca.value.orixa = newOrixa;
}
