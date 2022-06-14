import 'package:get/get.dart';
import 'package:saber_orixas/models/fronte_direita_model.dart';

class FronteDireitaController extends GetxController {
  var fronteDireita = FronteDireitaModel(number: 0).obs;
  var orixaFronteDireita = FrontDireitaOrixaModel(orixa: '').obs;

  void updateNumber(int newValue) => fronteDireita.value.number = newValue;

  void deleteNumber() => fronteDireita.value.number = 0;

  void updateOrixa(newOrixa) => orixaFronteDireita.value.orixa = newOrixa;
}
