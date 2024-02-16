// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:madagascar_constitution/core/constitution_language.dart' as _i5;
import 'package:madagascar_constitution/view/pages/content_page.dart' as _i1;
import 'package:madagascar_constitution/view/pages/home_page.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ContentRoute.name: (routeData) {
      final args = routeData.argsAs<ContentRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ContentPage(
          key: args.key,
          language: args.language,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ContentPage]
class ContentRoute extends _i3.PageRouteInfo<ContentRouteArgs> {
  ContentRoute({
    _i4.Key? key,
    required _i5.ConstitutionLanguage language,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ContentRoute.name,
          args: ContentRouteArgs(
            key: key,
            language: language,
          ),
          initialChildren: children,
        );

  static const String name = 'ContentRoute';

  static const _i3.PageInfo<ContentRouteArgs> page =
      _i3.PageInfo<ContentRouteArgs>(name);
}

class ContentRouteArgs {
  const ContentRouteArgs({
    this.key,
    required this.language,
  });

  final _i4.Key? key;

  final _i5.ConstitutionLanguage language;

  @override
  String toString() {
    return 'ContentRouteArgs{key: $key, language: $language}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
