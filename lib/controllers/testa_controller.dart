import 'package:get/get.dart';
import 'package:saber_orixas/models/testa_model.dart';

class TestaController extends GetxController {
  var testa = TestaModel(number: 0).obs;
  var orixaTesta = TestaOrixaModel(orixa: '').obs;

  void updateNumber(int newValue) =>
      testa.value.number = testa.value.number + newValue;

  void deleteNumber() => testa.value.number = 0;

  void updateOrixa(newOrixa) => orixaTesta.value.orixa = newOrixa;
}
