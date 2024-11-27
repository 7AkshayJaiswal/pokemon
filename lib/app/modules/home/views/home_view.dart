import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Search Pokemon cards...',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.cards.isEmpty) {
          return const Center(child: Text('No cards found'));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          controller: controller.scrollController,
          itemCount: controller.cards.length + 1,
          itemBuilder: (context, index) {
            if (index == controller.cards.length) {
              return controller.isLoadingMore.value
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox();
            }

            final card = controller.cards[index];
            return Hero(
              tag: 'card-${card.id}',
              child: Card(
                elevation: 4,
                child: InkWell(
                  onTap: () => Get.toNamed(
                    '/card-details',
                    arguments: card,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: card.images?.small ?? '',
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          card.name ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
