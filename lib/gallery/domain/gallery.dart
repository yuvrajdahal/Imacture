class GalleryData {
  final List<GalleryItem> data;

  GalleryData({required this.data});

  GalleryData copyWith({List<GalleryItem>? data}) {
    return GalleryData(data: data ?? this.data);
  }
}

class GalleryItem {
  final String id;
  final String createdAt;
  final int width;
  final int height;
  final String url;
  final String? username;
  GalleryItem({
    required this.id,
    required this.username,
    required this.url,
    required this.createdAt,
    required this.width,
    required this.height,
  });
  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      id: json['id'] as String,
      username: json['user']['username'] as String?,
      height: json['height'] as int,
      width: json['width'] as int,
      createdAt: json['created_at'] as String,
      url: json['urls']["regular"] as String,
    );
  }
}
