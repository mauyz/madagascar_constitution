// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:madagascar_constitution/core/constitution_language.dart' as _i6;
import 'package:madagascar_constitution/model/preamble.dart' as _i7;
import 'package:madagascar_constitution/view/pages/content_page.dart' as _i1;
import 'package:madagascar_constitution/view/pages/home_page.dart' as _i2;
import 'package:madagascar_constitution/view/pages/preamble_content_page.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ContentRoute.name: (routeData) {
      final args = routeData.argsAs<ContentRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ContentPage(
          key: args.key,
          language: args.language,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    PreambleContentRoute.name: (routeData) {
      final args = routeData.argsAs<PreambleContentRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PreambleContentPage(
          key: args.key,
          preamble: args.preamble,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ContentPage]
class ContentRoute extends _i4.PageRouteInfo<ContentRouteArgs> {
  ContentRoute({
    _i5.Key? key,
    required _i6.ConstitutionLanguage language,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ContentRoute.name,
          args: ContentRouteArgs(
            key: key,
            language: language,
          ),
          initialChildren: children,
        );

  static const String name = 'ContentRoute';

  static const _i4.PageInfo<ContentRouteArgs> page =
      _i4.PageInfo<ContentRouteArgs>(name);
}

class ContentRouteArgs {
  const ContentRouteArgs({
    this.key,
    required this.language,
  });

  final _i5.Key? key;

  final _i6.ConstitutionLanguage language;

  @override
  String toString() {
    return 'ContentRouteArgs{key: $key, language: $language}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PreambleContentPage]
class PreambleContentRoute extends _i4.PageRouteInfo<PreambleContentRouteArgs> {
  PreambleContentRoute({
    _i5.Key? key,
    required _i7.Preamble preamble,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          PreambleContentRoute.name,
          args: PreambleContentRouteArgs(
            key: key,
            preamble: preamble,
          ),
          initialChildren: children,
        );

  static const String name = 'PreambleContentRoute';

  static const _i4.PageInfo<PreambleContentRouteArgs> page =
      _i4.PageInfo<PreambleContentRouteArgs>(name);
}

class PreambleContentRouteArgs {
  const PreambleContentRouteArgs({
    this.key,
    required this.preamble,
  });

  final _i5.Key? key;

  final _i7.Preamble preamble;

  @override
  String toString() {
    return 'PreambleContentRouteArgs{key: $key, preamble: $preamble}';
  }
}
