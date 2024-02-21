// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:madagascar_constitution/core/constitution_language.dart'
    as _i10;
import 'package:madagascar_constitution/model/article.dart' as _i8;
import 'package:madagascar_constitution/model/constitution.dart' as _i9;
import 'package:madagascar_constitution/view/pages/article_content_page.dart'
    as _i1;
import 'package:madagascar_constitution/view/pages/constitution_pagination_page.dart'
    as _i2;
import 'package:madagascar_constitution/view/pages/home_page.dart' as _i3;
import 'package:madagascar_constitution/view/pages/search_content_page.dart'
    as _i4;
import 'package:madagascar_constitution/view/pages/tab_content_page.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    ArticleContentRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleContentRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ArticleContentPage(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ConstitutionPaginationRoute.name: (routeData) {
      final args = routeData.argsAs<ConstitutionPaginationRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ConstitutionPaginationPage(
          key: args.key,
          initialPage: args.initialPage,
          constitution: args.constitution,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    SearchContentRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SearchContentPage(),
      );
    },
    TabContentRoute.name: (routeData) {
      final args = routeData.argsAs<TabContentRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.TabContentPage(
          key: args.key,
          language: args.language,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ArticleContentPage]
class ArticleContentRoute extends _i6.PageRouteInfo<ArticleContentRouteArgs> {
  ArticleContentRoute({
    _i7.Key? key,
    required _i8.Article article,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ArticleContentRoute.name,
          args: ArticleContentRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleContentRoute';

  static const _i6.PageInfo<ArticleContentRouteArgs> page =
      _i6.PageInfo<ArticleContentRouteArgs>(name);
}

class ArticleContentRouteArgs {
  const ArticleContentRouteArgs({
    this.key,
    required this.article,
  });

  final _i7.Key? key;

  final _i8.Article article;

  @override
  String toString() {
    return 'ArticleContentRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i2.ConstitutionPaginationPage]
class ConstitutionPaginationRoute
    extends _i6.PageRouteInfo<ConstitutionPaginationRouteArgs> {
  ConstitutionPaginationRoute({
    _i7.Key? key,
    required int initialPage,
    required _i9.Constitution constitution,
    List<_i6.PageRouteInfo>? children,
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

  static const _i6.PageInfo<ConstitutionPaginationRouteArgs> page =
      _i6.PageInfo<ConstitutionPaginationRouteArgs>(name);
}

class ConstitutionPaginationRouteArgs {
  const ConstitutionPaginationRouteArgs({
    this.key,
    required this.initialPage,
    required this.constitution,
  });

  final _i7.Key? key;

  final int initialPage;

  final _i9.Constitution constitution;

  @override
  String toString() {
    return 'ConstitutionPaginationRouteArgs{key: $key, initialPage: $initialPage, constitution: $constitution}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SearchContentPage]
class SearchContentRoute extends _i6.PageRouteInfo<void> {
  const SearchContentRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SearchContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchContentRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TabContentPage]
class TabContentRoute extends _i6.PageRouteInfo<TabContentRouteArgs> {
  TabContentRoute({
    _i7.Key? key,
    required _i10.ConstitutionLanguage language,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          TabContentRoute.name,
          args: TabContentRouteArgs(
            key: key,
            language: language,
          ),
          initialChildren: children,
        );

  static const String name = 'TabContentRoute';

  static const _i6.PageInfo<TabContentRouteArgs> page =
      _i6.PageInfo<TabContentRouteArgs>(name);
}

class TabContentRouteArgs {
  const TabContentRouteArgs({
    this.key,
    required this.language,
  });

  final _i7.Key? key;

  final _i10.ConstitutionLanguage language;

  @override
  String toString() {
    return 'TabContentRouteArgs{key: $key, language: $language}';
  }
}
