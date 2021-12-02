import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ps_ocean/welcome.dart';

import 'lista.dart';
import 'main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String tipoAnimacao = 'idle';
  String acertoSenha = 'admin7355608';
  String acertoUsuario = 'AdministradorOceanTech';

  TextEditingController controleSenha = TextEditingController();
  TextEditingController controleUsuario = TextEditingController();

  FocusNode senhaNode = FocusNode();
  FocusNode usuarioNode = FocusNode();

  @override
  void initState() {
    this.senhaNode.addListener(() {
      if (this.senhaNode.hasFocus) {
        setState(() {
          this.tipoAnimacao = 'hands_up';
        });
      } else {
        setState(() {
          this.tipoAnimacao = 'hands_down';
        });
      }
    });

    this.usuarioNode.addListener(() {
      if (this.usuarioNode.hasFocus) {
        setState(() {
          this.tipoAnimacao = 'test';
        });
      } else {
        setState(() {
          this.tipoAnimacao = 'idle';
        });
      }
    });

    super.initState();
  }

  Future<void> signIn() async {
    await Future.delayed(Duration(milliseconds: 500));
    int autLogin = 0;

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (controleSenha.text.compareTo(acertoSenha) == 0 &&
        controleUsuario.text.compareTo(acertoUsuario) == 0) {
      setState(() {
        this.tipoAnimacao = 'success';
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      });
    } else {
      setState(() {
        this.tipoAnimacao = 'fail';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(40, 36, 36, 1),
        body: Center(
            child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Container(
              height: 300,
              width: 300,
              child: FlareActor(
                'assets/Teddy.flr',
                alignment: Alignment.bottomCenter,
                fit: BoxFit.contain,
                animation: this.tipoAnimacao,
                callback: (currentAnimation) {
                  setState(() {
                    this.tipoAnimacao = 'idle';
                  });
                },
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        focusNode: this.usuarioNode,
                        controller: this.controleUsuario,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Usuário",
                          contentPadding: EdgeInsets.all(20),
                        )),
                    Divider(),
                    TextFormField(
                      focusNode: this.senhaNode,
                      obscureText: true,
                      controller: this.controleSenha,
                      decoration: InputDecoration(
                        hintText: "Senha",
                        contentPadding: EdgeInsets.all(20),
                      ),
                    )
                  ],
                )),
            Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(31, 151, 212, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: signIn,
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        )));
  }
}
