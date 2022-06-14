import 'package:get/get.dart';
import 'package:saber_orixas/models/date_model.dart';

class DateController extends GetxController {
  var date = DateModel(number: '').obs;

  void updateDateNumber(newDate) => date.value.number = newDate.toString();
}
