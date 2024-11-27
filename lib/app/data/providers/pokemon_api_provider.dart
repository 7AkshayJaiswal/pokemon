import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/app/data/models/pokemon_card_model.dart';

class PokemonApiProvider extends GetConnect {
  static const String _baseUrl = 'https://api.pokemontcg.io/v2';

  @override
  void onInit() {
    httpClient.baseUrl = _baseUrl;
    super.onInit();
  }

  Future<List<PokemonCard>> getCards({
    int page = 1,
    int pageSize = 10,
    String query = '',
  }) async {
    final queryParams = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
      if (query.isNotEmpty) 'q': 'name:$query*',
    };
    Uri uri = Uri.parse(
        '$_baseUrl/cards?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}');
    debugPrint('uri: $uri');
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final List<dynamic> cardData =
        jsonDecode(response.body)['data'] as List<dynamic>;
    debugPrint('cardData.length: ${cardData.length}');
    return cardData.map((card) => PokemonCard.fromJson(card)).toList();
  }
}
