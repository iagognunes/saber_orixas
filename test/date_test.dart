import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:saber_orixas/controllers/date_controller.dart';

void main() {
  final DateController dateController = Get.put(DateController());

  _splitData(String date) {
    dateController.updateDateNumber(date.split(''));
  }

  test('Deve guardar a data', () {
    expect(dateController.date.value.number, '');
    dateController.updateDateNumber('12/09/1997');
    expect(dateController.date.value.number, '12/09/1997');
  });

  test('Deve separar cada numero da data', () {
    dateController
        .updateDateNumber(dateController.date.value.number.replaceAll('/', ''));
    expect(dateController.date.value.number, '12091997');
    _splitData(dateController.date.value.number);
    expect(dateController.date.value.number, '[1, 2, 0, 9, 1, 9, 9, 7]');
  });
}
