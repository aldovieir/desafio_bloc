import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pedantic/pedantic.dart';
import 'package:teste_bloc/app/models/item.dart';
import 'package:meta/meta.dart';
import 'package:teste_bloc/shared/repository/repository.dart';
part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit({@required this.repository}) : super(ListState.loading());

  final Repository repository;

  selectedRepository() {
    state.mock = !state.mock;
  }

  Future<void> fetchList() async {
    if (state.mock) {
      emit(ListState.loading());
      try {
        final items = await repository.getCadastros();
        emit(ListState.success(items, true));
      } on Exception {
        emit(ListState.failure());
      }
    } else {
      emit(ListState.loading());
      try {
        final items = await repository.fetchItems();
        emit(ListState.success(items, false));
      } on Exception {
        emit(ListState.failure());
      }
    }
  }

  Future<void> addCadastro() async {
    Item item = Item(
      cpf: state.cpf,
      dataNascimento: state.dataNascimento,
      genero: state.genero,
      nomeMae: state.nomeMae,
    );
    await repository.addCadastro(item).then((list) {
      if (list.data == null) {
        state.itens.add(item);
        emit(ListState.success(state.itens, true));
      } else {
        state.itens.add(item);
        emit(ListState.success(state.itens, true));
      }
    });
  }

  Future<void> deleteItemApi(Item item) async {
    await repository.deleteItemApi(item);
    /*  final deleteInProgress = state.itens.map((item) {
      return item.id == item.id ? item.copyWith(isDeleting: true) : item;
    }).toList();

    emit(ListState.success(deleteInProgress, true)); */

    unawaited(repository.deleteItem(item.id).then((_) {
      final deleteSuccess = List.of(state.itens)
        ..removeWhere((element) => element.id == item.id);
      emit(ListState.success(deleteSuccess, true));
    }));
  }

  Future<void> deleteItem(String id) async {
    final deleteInProgress = state.itens.map((item) {
      return item.id == id ? item.copyWith(isDeleting: true) : item;
    }).toList();

    emit(ListState.success(deleteInProgress, false));

    unawaited(repository.deleteItem(id).then((_) {
      final deleteSuccess = List.of(state.itens)
        ..removeWhere((element) => element.id == id);
      emit(ListState.success(deleteSuccess, false));
    }));
  }

  addItemMock() {
    state.itens.add(Item(
      id: Random().nextInt(10).toString(),
      cpf: state.cpf,
      dataNascimento: state.dataNascimento,
      genero: state.genero,
      nomeMae: state.nomeMae,
    ));

    emit(ListState.success(state.itens, false));
  }
}
