import 'package:get/get.dart';
import 'package:saber_orixas/models/fronte_esquerda_model.dart';

class FronteEsquerdaController extends GetxController {
  var fronteEsquerda = FronteEsquerdaModel(number: 0).obs;
  var orixaFronteEsquerda = FronteEsquerdaOrixaModel(orixa: '').obs;

  void updateNumber(int newValue) => fronteEsquerda.value.number = newValue;

  void deleteNumber() => fronteEsquerda.value.number = 0;

  void updateOrixa(newOrixa) => orixaFronteEsquerda.value.orixa = newOrixa;
}
