import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imacture/core/shared/provider.dart';
import 'package:imacture/gallery/domain/gallery.dart';
import 'package:imacture/gallery/infrastrcutre/gallery_service.dart';

class GalleryDataNotifier extends StateNotifier<GalleryData> {
  final GalleryService _galleryService;

  GalleryDataNotifier(this._galleryService) : super(GalleryData(data: [])) {
    // Fetch data on initialization
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final data = await _galleryService.getPhotos();
      state = state.copyWith(data: data.data);
    } catch (e) {
      log('Error fetching data: $e');
      throw Exception('Error fetching data: $e');
    }
  }
}

final galleryServiceProvider = Provider<GalleryService>((ref) {
  final dio = ref.read(dioProvider);
  return GalleryService(dio);
});

final galleryDataNotifierProvider =
    StateNotifierProvider<GalleryDataNotifier, GalleryData>((ref) {
  final galleryService = ref.watch(galleryServiceProvider);
  return GalleryDataNotifier(galleryService);
});
