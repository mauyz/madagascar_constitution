// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:madagascar_constitution/model/article.dart' as _i7;
import 'package:madagascar_constitution/model/constitution.dart' as _i8;
import 'package:madagascar_constitution/view/pages/article_content_page.dart'
    as _i1;
import 'package:madagascar_constitution/view/pages/constitution_pagination_page.dart'
    as _i2;
import 'package:madagascar_constitution/view/pages/home_page.dart' as _i3;
import 'package:madagascar_constitution/view/pages/search_content_page.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ArticleContentRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleContentRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ArticleContentPage(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ConstitutionPaginationRoute.name: (routeData) {
      final args = routeData.argsAs<ConstitutionPaginationRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ConstitutionPaginationPage(
          key: args.key,
          initialPage: args.initialPage,
          constitution: args.constitution,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    SearchContentRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SearchContentPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ArticleContentPage]
class ArticleContentRoute extends _i5.PageRouteInfo<ArticleContentRouteArgs> {
  ArticleContentRoute({
    _i6.Key? key,
    required _i7.Article article,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ArticleContentRoute.name,
          args: ArticleContentRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleContentRoute';

  static const _i5.PageInfo<ArticleContentRouteArgs> page =
      _i5.PageInfo<ArticleContentRouteArgs>(name);
}

class ArticleContentRouteArgs {
  const ArticleContentRouteArgs({
    this.key,
    required this.article,
  });

  final _i6.Key? key;

  final _i7.Article article;

  @override
  String toString() {
    return 'ArticleContentRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i2.ConstitutionPaginationPage]
class ConstitutionPaginationRoute
    extends _i5.PageRouteInfo<ConstitutionPaginationRouteArgs> {
  ConstitutionPaginationRoute({
    _i6.Key? key,
    required int initialPage,
    required _i8.Constitution constitution,
    List<_i5.PageRouteInfo>? children,
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

  static const _i5.PageInfo<ConstitutionPaginationRouteArgs> page =
      _i5.PageInfo<ConstitutionPaginationRouteArgs>(name);
}

class ConstitutionPaginationRouteArgs {
  const ConstitutionPaginationRouteArgs({
    this.key,
    required this.initialPage,
    required this.constitution,
  });

  final _i6.Key? key;

  final int initialPage;

  final _i8.Constitution constitution;

  @override
  String toString() {
    return 'ConstitutionPaginationRouteArgs{key: $key, initialPage: $initialPage, constitution: $constitution}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SearchContentPage]
class SearchContentRoute extends _i5.PageRouteInfo<void> {
  const SearchContentRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SearchContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchContentRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
