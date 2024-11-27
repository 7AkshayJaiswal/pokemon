import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:pokemon/app/data/models/pokemon_card_model.dart';

import '../controllers/card_details_controller.dart';

class CardDetailsView extends GetView<CardDetailsController> {
  const CardDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final card = Get.arguments as PokemonCard;

    return Scaffold(
      appBar: AppBar(
        title: Text(card.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'card-${card.id}',
              child: CachedNetworkImage(
                imageUrl: card.images?.large ?? '',
                height: 300,
                fit: BoxFit.contain,
                placeholder: (context, url) => const SizedBox(
                  height: 300,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const SizedBox(
                  height: 300,
                  child: Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailItem('Set', card.set?.name ?? ''),
                  _buildDetailItem('Type', card.types?.join(', ') ?? ''),
                  _buildDetailItem('Artist', card.artist ?? ''),
                  if (card.attacks != null) ...[
                    const SizedBox(height: 16),
                    const Text(
                      'Attacks',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ...card.attacks!.map((attack) => _buildAttackItem(attack)),
                  ],
                  if (card.weaknesses != null) ...[
                    const SizedBox(height: 16),
                    const Text(
                      'Weaknesses',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ...card.weaknesses!
                        .map((weakness) => _buildWeaknessItem(weakness)),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildAttackItem(Attack attack) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              attack.name ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (attack.damage != null && attack.damage!.isNotEmpty)
              Text('Damage: ${attack.damage}'),
            if (attack.text != null) Text(attack.text ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _buildWeaknessItem(Weakness weakness) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(weakness.type ?? ''),
            const SizedBox(width: 8),
            Text(weakness.value ?? ''),
          ],
        ),
      ),
    );
  }
}
