import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import '../../../data/models/pokemon_card_model.dart';
import '../../../data/providers/pokemon_api_provider.dart';

class HomeController extends GetxController {
  final _pokemonApiProvider = PokemonApiProvider();
  final cards = <PokemonCard>[].obs;
  final isLoading = true.obs;
  final isLoadingMore = false.obs;
  final searchQuery = ''.obs;

  late ScrollController scrollController;
  int page = 1;
  static const int pageSize = 20;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController()..addListener(_scrollListener);
    fetchCards();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
    cards.clear();
    page = 1;
    fetchCards();
  }

  Future<void> fetchCards() async {
    try {
      if (page == 1) {
        isLoading.value = true;
        cards.clear();
      }
      List<PokemonCard> response = await _pokemonApiProvider.getCards(
        page: page,
        pageSize: pageSize,
        query: searchQuery.value,
      );
      cards.addAll(response);
    } catch (e) {
      debugPrint('Error details: $e');
      Get.snackbar(
        'Error',
        'Failed to load Pokemon cards',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMore() async {
    if (isLoadingMore.value) return;

    try {
      isLoadingMore.value = true;
      page++;
      await fetchCards();
    } finally {
      isLoadingMore.value = false;
    }
  }
}
