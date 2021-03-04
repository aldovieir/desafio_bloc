part of 'list_cubit.dart';

enum ListStatus { loading, success, failure }

// ignore: must_be_immutable
class ListState extends Equatable {
  ListState._(
      {this.status = ListStatus.loading, this.itens, this.mock = false});

  ListState.loading() : this._();

  ListState.success(List<Item> itens, bool mock)
      : this._(status: ListStatus.success, itens: itens, mock: mock);

  ListState.failure() : this._(status: ListStatus.failure);

  ListStatus status;
  List<Item> itens;
  String cpf;
  DateTime dataNascimento;
  String genero;
  String nomeMae;
  int selected;
  bool mock = false;

  List<String> generoList = [
    'Masculino',
    'Feminino',
    'Outros',
  ];
  @override
  List<Object> get props => [
        status,
        itens,
        cpf,
        dataNascimento,
        genero,
        nomeMae,
        generoList,
        selected,
        mock
      ];
}
