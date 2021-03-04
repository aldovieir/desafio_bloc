import 'package:equatable/equatable.dart';
import 'dart:convert';

// ignore: must_be_immutable
class Item extends Equatable {
  Item({
    this.id,
    this.cpf,
    this.nomeMae,
    this.dataNascimento,
    this.genero,
    this.isDeleting = false,
  });

  String id;
  String cpf;
  String nomeMae;
  DateTime dataNascimento;
  String genero;

  bool isDeleting;

  Item copyWith({
    String id,
    String cpf,
    String nomeMae,
    DateTime dataNascimento,
    String genero,
    bool isDeleting,
  }) {
    return Item(
      id: id ?? this.id,
      cpf: cpf ?? this.cpf,
      nomeMae: nomeMae ?? this.nomeMae,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      genero: genero ?? this.genero,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) {
    return Item(
        id: json["id"] == null ? null : json["id"],
        cpf: json["cpf"] == null ? null : json["cpf"],
        nomeMae: json["nome_mae"] == null ? null : json["nome_mae"],
        dataNascimento: DateTime.parse(json["data_nascimento"]) == null
            ? null
            : DateTime.parse(json["data_nascimento"]),
        genero: json["genero"] == null ? null : json["genero"],
        isDeleting: false);
  }
  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "cpf": cpf == null ? null : cpf,
        "nome_mae": nomeMae == null ? null : nomeMae,
        "data_nascimento":
            dataNascimento == null ? null : dataNascimento.toIso8601String(),
        "genero": genero == null ? null : genero,
        "isDeleting": isDeleting,
      };

  static List<Item> fromJsonList(List list) {
    if (list == null) return null;
    print(list);
    return list.map((item) {
      print(item);
      return Item.fromMap(item);
    }).toList();
  }

  @override
  List<Object> get props => [
        id,
        cpf,
        nomeMae,
        dataNascimento,
        genero,
      ];
}
