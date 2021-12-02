import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(children: [
          Positioned.fill(
              child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/fundopeixe.jpg',
              fit: BoxFit.cover,
            ),
          )),
          Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Center(
                  child: Image.asset('assets/goal14.png'),
                ),
                SizedBox(height: 40),
                Text(
                    'O oceano impulsiona sistemas globais que tornam a Terra habitável para a humanidade. Nossa água da chuva, água potável, tempo, clima, costas, grande parte de nossa comida e até mesmo o oxigênio do ar que respiramos, são todos fornecidos e regulados pelo mar. \n\n' +
                        'O gerenciamento cuidadoso desse recurso global essencial é uma característica fundamental de um futuro sustentável. Com isso criamos esse aplicativo com algumas metas e objetivos a serem notados, pois infelizmente há uma contínua deterioração das águas costeiras devido à poluição, e a acidificação dos oceanos está tendo um efeito adverso sobre o funcionamento dos ecossistemas e da biodiversidade. Isso também está impactando negativamente a pesca em pequena escala. \n\n ' +
                        'Salvar nosso oceano deve permanecer uma prioridade! \n',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 40),
              ]))
        ]),
      ),
    );
  }
}
