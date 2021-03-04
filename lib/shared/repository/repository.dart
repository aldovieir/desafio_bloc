import 'dart:async';
import 'dart:math';
import 'package:dio/dio.dart';

import 'package:teste_bloc/app/models/item.dart';
import 'package:teste_bloc/shared/mock_list.dart';

class Repository {
  final Dio dio = Dio();
  final _random = Random();
  var urlMock = 'https://603c2f43f4333a0017b673f2.mockapi.io/TestBloc';
  var id;

  Future<Response<dynamic>> addCadastro(Item item) {
    return dio.post(urlMock, data: item.toJson());
  }

  Future<List<Item>> getCadastros() async {
    return await dio.get(urlMock).then((itens) async {
      print(itens);

      return Item.fromJsonList(itens.data);
    });
  }

  int _randomRange(int min, int max) => min + _random.nextInt(max - min);

  Future<List<Item>> fetchItems() async {
    await Future<void>.delayed(Duration(seconds: _randomRange(1, 5)));
    return List.of(_generateItemsList());
  }

  List<Item> _generateItemsList() {
    return MockList().getList();
  }

  Future<dynamic> deleteItemApi(Item item) async {
    return await dio.delete('$urlMock/${item.id}');
  }

  Future<void> deleteItem(String id) async {
    await Future<void>.delayed(Duration(seconds: _randomRange(1, 5)));
  }
}
