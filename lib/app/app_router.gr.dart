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
import 'package:madagascar_constitution/model/constitution.dart' as _i6;
import 'package:madagascar_constitution/view/pages/constitution_pagination_page.dart'
    as _i1;
import 'package:madagascar_constitution/view/pages/home_page.dart' as _i2;
import 'package:madagascar_constitution/view/pages/tab_content_page.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ConstitutionPaginationRoute.name: (routeData) {
      final args = routeData.argsAs<ConstitutionPaginationRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ConstitutionPaginationPage(
          key: args.key,
          initialPage: args.initialPage,
          constitution: args.constitution,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
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
/// [_i1.ConstitutionPaginationPage]
class ConstitutionPaginationRoute
    extends _i4.PageRouteInfo<ConstitutionPaginationRouteArgs> {
  ConstitutionPaginationRoute({
    _i5.Key? key,
    required int initialPage,
    required _i6.Constitution constitution,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ConstitutionPaginationRoute.name,
          args: ConstitutionPaginationRouteArgs(
            key: key,
            initialPage: initialPage,
            constitution: constitution,
          ),
          initialChildren: children,
        );

  static const String name = 'ConstitutionPaginationRoute';

  static const _i4.PageInfo<ConstitutionPaginationRouteArgs> page =
      _i4.PageInfo<ConstitutionPaginationRouteArgs>(name);
}

class ConstitutionPaginationRouteArgs {
  const ConstitutionPaginationRouteArgs({
    this.key,
    required this.initialPage,
    required this.constitution,
  });

  final _i5.Key? key;

  final int initialPage;

  final _i6.Constitution constitution;

  @override
  String toString() {
    return 'ConstitutionPaginationRouteArgs{key: $key, initialPage: $initialPage, constitution: $constitution}';
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
