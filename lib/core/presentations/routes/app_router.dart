import 'package:auto_route/auto_route.dart';
import 'package:imacture/splash/presentation/splash_page.dart';
import "package:imacture/gallery/presentation/gallery_page.dart";

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // add your routes here
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: GalleryRoute.page, path: "/gallery"),
      ];
}
