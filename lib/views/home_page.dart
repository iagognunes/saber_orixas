import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:saber_orixas/components/size_screen.dart';
import 'package:saber_orixas/controllers/centro_controller.dart';
import 'package:saber_orixas/controllers/date_controller.dart';
import 'package:saber_orixas/controllers/fronte_direita_controller.dart';
import 'package:saber_orixas/controllers/fronte_esquerda_controller.dart';
import 'package:saber_orixas/controllers/nuca_controller.dart';
import 'package:saber_orixas/controllers/testa_controller.dart';
import 'package:saber_orixas/views/orixas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dateTextController = TextEditingController();
  var maskDate = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  final DateController dateController = Get.put(DateController());
  final NucaController nucaController = Get.put(NucaController());
  final TestaController testaController = Get.put(TestaController());
  final CentroController centroController = Get.put(CentroController());
  final FronteDireitaController fronteDireitaController =
      Get.put(FronteDireitaController());
  final FronteEsquerdaController fronteEsquerdaController =
      Get.put(FronteEsquerdaController());

  _calcularOrixas() {
    dateController.updateDateNumber(maskDate.getUnmaskedText());
    _calcularNuca();
    _calcularTesta();
    _calcularFronteDireita();
    _calcularFronteEsquerda();
    _calcularCentro();
    Get.off(() => const OrixasPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          child: SizedBox(
            width: displaySize(context).width * 0.9,
            height: displaySize(context).height * 0.7,
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Qual a sua data de nascimento?'),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 30, right: 30),
                    child: SizedBox(
                      width: constraints.maxWidth * 0.9,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: dateTextController,
                        inputFormatters: [maskDate],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF000000),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'dd/mm/yyyy',
                        ),
                        onEditingComplete: () {
                          _calcularOrixas();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: constraints.maxWidth * 0.5,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color(0xFF262120),
                        border: Border.all(
                          color: const Color(0xFF262120),
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        onPressed: () {
                          _calcularOrixas();
                          debugPrint(dateController.date.value.number);
                        },
                        child: const Text(
                          'Pesquisar',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  _switchCaseOrixas(controller, valueController) {
    switch (valueController) {
      case 1:
        controller.updateOrixa('Exu');
        break;
      case 2:
        controller.updateOrixa('Ibejis e Ogum');
        break;
      case 3:
        controller.updateOrixa('Ogum e Obaluayê');
        break;
      case 4:
        controller.updateOrixa('Iansã e Iemanjá');
        break;
      case 5:
        controller.updateOrixa('Oxum e Logun Edê');
        break;
      case 6:
        controller.updateOrixa('Oxóssi e Xangô');
        break;
      case 7:
        controller.updateOrixa('Omolu e Exu');
        break;
      case 8:
        controller.updateOrixa('Oxaguiãn, Ogum e Xangô Airá');
        break;
      case 9:
        controller.updateOrixa('Iemanjá e Iansã');
        break;
      case 10:
        controller.updateOrixa('Oxalá');
        break;
      case 11:
        controller.updateOrixa('Iansã, Ogum e Exu');
        break;
      case 12:
        controller.updateOrixa('Xangô');
        break;
      case 13:
        controller.updateOrixa('Nanã e Obaluayê');
        break;
      case 14:
        controller.updateOrixa('Oxumaré');
        break;
      case 15:
        controller.updateOrixa('Ogum, Iemanjá, Omolu e Obá');
        break;
      case 16:
        controller.updateOrixa('Oxalá e Orumilá');
        break;
      default:
        controller.updateOrixa('');
    }
  }

  _calcularNuca() {
    nucaController.deleteNumber();
    List<int> dateList = [];
    var arrayValueDate = dateController.date.value.number.split('');

    for (var i in arrayValueDate) {
      dateList.add(int.parse(i));
    }

    String teste = dateList.asMap().entries.map((e) {
      if (e.key % 2 == 0) {
        return e.value;
      }
    }).toString();

    teste = teste.replaceAll(RegExp(r'[^0-9]'), '');

    var teste2 = teste.split('');

    for (var h in teste2) {
      nucaController.updateNumber(int.parse(h));
    }

    if (nucaController.nuca.value.number > 16) {
      var somarList = nucaController.nuca.value.number.toString().split('');
      var somar = int.parse(somarList[0]) + int.parse(somarList[1]);
      nucaController.deleteNumber();
      nucaController.updateNumber(somar);
    }

    _switchCaseOrixas(nucaController, nucaController.nuca.value.number);

    debugPrint(
        'Número da nuca: ${nucaController.nuca.value.number.toString()}');
  }

  _calcularTesta() {
    testaController.deleteNumber();
    List<int> dateList = [];

    for (var i in dateController.date.value.number.split('')) {
      dateList.add(int.parse(i));
    }

    String teste = dateList.asMap().entries.map((e) {
      if (e.key % 2 == 1) {
        return e.value;
      }
    }).toString();

    teste = teste.replaceAll(RegExp(r'[^0-9]'), '');

    var teste2 = teste.split('');

    for (var h in teste2) {
      testaController.updateNumber(int.parse(h));
    }

    if (testaController.testa.value.number > 16) {
      var somarList = testaController.testa.value.number.toString().split('');
      var somar = int.parse(somarList[0]) + int.parse(somarList[1]);
      testaController.deleteNumber();
      testaController.updateNumber(somar);
    }
    _switchCaseOrixas(testaController, testaController.testa.value.number);

    debugPrint(
        'Número da testa: ${testaController.testa.value.number.toString()}');
  }

  _calcularFronteDireita() {
    var somaNucaTesta =
        nucaController.nuca.value.number + testaController.testa.value.number;

    if (somaNucaTesta > 16) {
      var somarList = somaNucaTesta.toString().split('');
      var somar = int.parse(somarList[0]) + int.parse(somarList[1]);
      fronteDireitaController.deleteNumber();
      fronteDireitaController.updateNumber(somar);

      _switchCaseOrixas(fronteDireitaController,
          fronteDireitaController.fronteDireita.value.number);

      debugPrint(
          'Número da Fronte Direita: ${fronteDireitaController.fronteDireita.value.number}');
    } else {
      fronteDireitaController.updateNumber(somaNucaTesta);

      _switchCaseOrixas(fronteDireitaController,
          fronteDireitaController.fronteDireita.value.number);

      debugPrint(
          'Número da Fronte Direita: ${fronteDireitaController.fronteDireita.value.number}');
    }
  }

  _calcularFronteEsquerda() {
    int somarFronteEsquerda = nucaController.nuca.value.number +
        testaController.testa.value.number +
        fronteDireitaController.fronteDireita.value.number;

    if (somarFronteEsquerda > 16) {
      var somarList = somarFronteEsquerda.toString().split('');
      var somar = int.parse(somarList[0]) + int.parse(somarList[1]);
      fronteEsquerdaController.deleteNumber();
      fronteEsquerdaController.updateNumber(somar);

      _switchCaseOrixas(fronteEsquerdaController,
          fronteEsquerdaController.fronteEsquerda.value.number);

      debugPrint(
          'Número da Fronte Esquerda: ${fronteEsquerdaController.fronteEsquerda.value.number}');
    } else {
      fronteEsquerdaController.updateNumber(somarFronteEsquerda);

      _switchCaseOrixas(fronteEsquerdaController,
          fronteEsquerdaController.fronteEsquerda.value.number);

      debugPrint(
          'Número da Fronte Esquerda: ${fronteEsquerdaController.fronteEsquerda.value.number}');
    }
  }

  _calcularCentro() {
    // debugPrint(dateController.date.value.number);
    var splitData = dateController.date.value.number.split('');
    for (var d in splitData) {
      centroController.updateNumber(int.parse(d));
    }

    if (centroController.centro.value.number > 16) {
      var somarList = centroController.centro.value.number.toString().split('');
      var somar = int.parse(somarList[0]) + int.parse(somarList[1]);
      centroController.deleteNumber();
      centroController.updateNumber(somar);

      _switchCaseOrixas(centroController, centroController.centro.value.number);

      debugPrint(
          'Número da Fronte centro: ${centroController.centro.value.number}');
    } else {
      _switchCaseOrixas(centroController, centroController.centro.value.number);

      debugPrint(
          'Número do centro: ${centroController.centro.value.number.toString()}');
    }
  }
}
