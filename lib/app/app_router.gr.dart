// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:madagascar_constitution/core/constitution_language.dart' as _i7;
import 'package:madagascar_constitution/model/preamble.dart' as _i6;
import 'package:madagascar_constitution/view/pages/home_page.dart' as _i1;
import 'package:madagascar_constitution/view/pages/preamble_content_page.dart'
    as _i2;
import 'package:madagascar_constitution/view/pages/tab_content_page.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    PreambleContentRoute.name: (routeData) {
      final args = routeData.argsAs<PreambleContentRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PreambleContentPage(
          key: args.key,
          preamble: args.preamble,
        ),
      );
    },
    TabContentRoute.name: (routeData) {
      final args = routeData.argsAs<TabContentRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.TabContentPage(
          key: args.key,
          language: args.language,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
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
/// [_i2.PreambleContentPage]
class PreambleContentRoute extends _i4.PageRouteInfo<PreambleContentRouteArgs> {
  PreambleContentRoute({
    _i5.Key? key,
    required _i6.Preamble preamble,
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

  final _i6.Preamble preamble;

  @override
  String toString() {
    return 'PreambleContentRouteArgs{key: $key, preamble: $preamble}';
  }
}

/// generated route for
/// [_i3.TabContentPage]
class TabContentRoute extends _i4.PageRouteInfo<TabContentRouteArgs> {
  TabContentRoute({
    _i5.Key? key,
    required _i7.ConstitutionLanguage language,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          TabContentRoute.name,
          args: TabContentRouteArgs(
            key: key,
            language: language,
          ),
          initialChildren: children,
        );

  static const String name = 'TabContentRoute';

  static const _i4.PageInfo<TabContentRouteArgs> page =
      _i4.PageInfo<TabContentRouteArgs>(name);
}

class TabContentRouteArgs {
  const TabContentRouteArgs({
    this.key,
    required this.language,
  });

  final _i5.Key? key;

  final _i7.ConstitutionLanguage language;

  @override
  String toString() {
    return 'TabContentRouteArgs{key: $key, language: $language}';
  }
}
