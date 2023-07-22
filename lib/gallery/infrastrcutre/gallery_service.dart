import "dart:developer";

import "package:dio/dio.dart";
import "package:imacture/gallery/domain/gallery.dart";

class GalleryService {
  final Dio _dio;
  Future<GalleryData> getPhotos() async {
    try {
      final response = await _dio.get('/photos');

      if (response.statusCode == 200) {
        final responseData = response.data;
        final List<GalleryItem> galleryItems =
            (responseData as List).map((json) {
          return GalleryItem.fromJson(json);
        }).toList();
        final galleryData = GalleryData(data: galleryItems);

        return galleryData;
      }
      throw Exception('Failed to fetch data');
    } on DioException catch (e) {
      // Handle DioException here
      if (e.response != null) {
        // Dio server error (non-200 status code)
        final errorMessage = e.response?.data.toString();
        log(errorMessage!);
        throw Exception(errorMessage);
      } else {
        // Dio client error (no response from server)
        log('Error sending request: $e');
        throw Exception('Failed to connect to the server');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception(); // General server error
    }
  }

  GalleryService(this._dio);
}
