import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imacture/gallery/shared/providers.dart';

@RoutePage()
class GalleryPage extends ConsumerWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galleryState = ref.watch(galleryDataNotifierProvider);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    const double firstColumnTopPadding = 8.0;
    const double firstColumnBottomPadding = 16.0;
    const double secondColumnTopPadding = 16;
    const double secondColumnBottomPadding = 8.0;
    const double horizontalPadding = 8.0;

    if (galleryState.data.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(8),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF141A32),
                Color(0xFF2A3251)
              ], // Replace these colors with your desired gradient colors
            ),
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: horizontalPadding,
              mainAxisSpacing:
                  firstColumnTopPadding, // Vertical spacing between items
            ),
            itemCount: galleryState.data.length,
            itemBuilder: (context, index) {
              final galleryItem = galleryState.data[index];
              return GestureDetector(
                onTap: () {
                  // Implement the onTap behavior if needed
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    index % 2 == 0
                        ? horizontalPadding
                        : 0.0, // Left padding for even index (first column)
                    index % 2 == 0
                        ? firstColumnTopPadding
                        : secondColumnTopPadding, // Top padding based on index
                    index % 2 == 0
                        ? 0.0
                        : horizontalPadding, // Right padding for odd index (second column)
                    index % 2 == 0
                        ? firstColumnBottomPadding
                        : secondColumnBottomPadding, // Bottom padding based on index
                  ),
                  child: Image.network(
                    galleryItem.url,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
