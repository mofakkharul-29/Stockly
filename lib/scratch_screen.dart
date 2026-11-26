import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockly/core/error/failure.dart';
import 'package:stockly/features/products/data/product_providers.dart';

class ScratchScreen extends ConsumerWidget {
  const ScratchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final page = await ref
                  .read(productRepositoryProvider)
                  .getProducts(limit: 10, skip: 0);
              debugPrint(
                'RESULT items: ${page.items.length}, '
                'total: ${page.total}, hasMore: ${page.hasMore}',
              );
              for (final p in page.items) {
                debugPrint('RESULT ${p.title} | brand: ${p.brand}');
              }
            } on Failure catch (f) {
              debugPrint('RESULT $f');
            }
          },
          child: const Text('Test products'),
        ),
      ),
    );
  }
}