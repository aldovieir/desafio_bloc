import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_import.dart';

class NomeMaePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return BlocBuilder<ListCubit, ListState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: _height * 0.25),
          child: Column(
            children: <Widget>[
              Text(
                'Qual é o nome da sua Mãe?',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: EdgeInsets.only(top: _height * 0.18),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        controller: TextEditingController(
                            text: state.nomeMae == 'Campo obrigatório' ||
                                    state.nomeMae == 'Preencha Nome completo'
                                ? ''
                                : state.nomeMae),
                        onChanged: (texto) {
                          state.nomeMae = texto;
                          if (state.nomeMae.isEmpty) {
                            return state.nomeMae = 'Campo obrigatório';
                          } else if (state.nomeMae.trim().split(' ').length <=
                              1) {
                            return state.nomeMae = 'Preencha Nome completo';
                          }
                          return null;
                        },
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 21),
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                            //labelText: '',
                            hintText: "Nome da mãe",
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 18),
                            border: InputBorder.none),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            state.nomeMae == 'Campo obrigatório'
                                ? 'Campo obrigatório'
                                : state.nomeMae == 'Preencha Nome completo'
                                    ? 'Preencha Nome completo'
                                    : 'NOME COMPLETO',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white38),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

}
