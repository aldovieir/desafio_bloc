import 'package:teste_bloc/app/app_import.dart';

class MockList {
  List<Item> getList() {
    var a = Item(
        cpf: '852.654.753.55',
        dataNascimento: DateTime(1991, 12, 11),
        genero: 'Masculino',
        id: '1',
        nomeMae: 'Maria Antonieta',
        isDeleting: false);
    var b = Item(
        cpf: '123..510.521.77',
        dataNascimento: DateTime(1998, 7, 18),
        genero: 'Masculino',
        id: '2',
        nomeMae: 'Lucia Alvez',
        isDeleting: false);
    var c = Item(
        cpf: '123.312.554-88',
        dataNascimento: DateTime(1984, 1, 15),
        genero: 'Masculino',
        id: '3',
        nomeMae: 'Geovana Alburquerque',
        isDeleting: false);
    return [a, b, c];
  }
}
