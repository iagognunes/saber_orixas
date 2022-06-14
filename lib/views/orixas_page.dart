import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saber_orixas/components/size_screen.dart';
import 'package:saber_orixas/controllers/centro_controller.dart';
import 'package:saber_orixas/controllers/date_controller.dart';
import 'package:saber_orixas/controllers/fronte_direita_controller.dart';
import 'package:saber_orixas/controllers/fronte_esquerda_controller.dart';
import 'package:saber_orixas/controllers/nuca_controller.dart';
import 'package:saber_orixas/controllers/testa_controller.dart';
import 'package:saber_orixas/views/home_page.dart';

class OrixasPage extends StatefulWidget {
  const OrixasPage({Key? key}) : super(key: key);

  @override
  State<OrixasPage> createState() => _OrixasPageState();
}

class _OrixasPageState extends State<OrixasPage> {
  final DateController dateController = Get.put(DateController());
  final NucaController nucaController = Get.put(NucaController());
  final TestaController testaController = Get.put(TestaController());
  final CentroController centroController = Get.put(CentroController());
  final FronteDireitaController fronteDireitaController =
      Get.put(FronteDireitaController());
  final FronteEsquerdaController fronteEsquerdaController =
      Get.put(FronteEsquerdaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: displaySize(context).width * 0.9,
                height: displaySize(context).height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Orixá da nuca: ${nucaController.orixaNuca.value.orixa}'),
                    Text(
                        'Orixá da testa: ${testaController.orixaTesta.value.orixa}'),
                    Text(
                        'Orixá da Fronte Direita: ${fronteDireitaController.orixaFronteDireita.value.orixa}'),
                    Text(
                        'Orixá da Fronte Esquerda: ${fronteEsquerdaController.orixaFronteEsquerda.value.orixa}'),
                    Text(
                        'Orixá do centro: ${centroController.orixaCentro.value.orixa}'),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        width: constraints.maxWidth * 0.6,
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
                            Get.off(() => const HomePage());
                          },
                          child: const Text(
                            'Pesquisar de novo',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
