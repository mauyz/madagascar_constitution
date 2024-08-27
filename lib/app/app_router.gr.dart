// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/foundation.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:madagascar_constitution/view/pages/article_content_page.dart'
    as _i1;
import 'package:madagascar_constitution/view/pages/constitution_pagination_page.dart'
    as _i2;
import 'package:madagascar_constitution/view/pages/home_page.dart' as _i3;
import 'package:madagascar_constitution/view/pages/not_found_page.dart' as _i4;
import 'package:madagascar_constitution/view/pages/search_content_page.dart'
    as _i5;

/// generated route for
/// [_i1.ArticleContentPage]
class ArticleContentRoute extends _i6.PageRouteInfo<ArticleContentRouteArgs> {
  ArticleContentRoute({
    _i7.Key? key,
    required String language,
    required int id,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ArticleContentRoute.name,
          args: ArticleContentRouteArgs(
            key: key,
            language: language,
            id: id,
          ),
          rawPathParams: {
            'language': language,
            'id': id,
          },
          initialChildren: children,
        );

  static const String name = 'ArticleContentRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ArticleContentRouteArgs>(
          orElse: () => ArticleContentRouteArgs(
                language: pathParams.getString('language'),
                id: pathParams.getInt('id'),
              ));
      return _i1.ArticleContentPage(
        key: args.key,
        language: args.language,
        id: args.id,
      );
    },
  );
}

class ArticleContentRouteArgs {
  const ArticleContentRouteArgs({
    this.key,
    required this.language,
    required this.id,
  });

  final _i7.Key? key;

  final String language;

  final int id;

  @override
  String toString() {
    return 'ArticleContentRouteArgs{key: $key, language: $language, id: $id}';
  }
}

/// generated route for
/// [_i2.ConstitutionPaginationPage]
class ConstitutionPaginationRoute
    extends _i6.PageRouteInfo<ConstitutionPaginationRouteArgs> {
  ConstitutionPaginationRoute({
    _i8.Key? key,
    required String language,
    int? title,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ConstitutionPaginationRoute.name,
          args: ConstitutionPaginationRouteArgs(
            key: key,
            language: language,
            title: title,
          ),
          rawPathParams: {'language': language},
          rawQueryParams: {'title': title},
          initialChildren: children,
        );

  static const String name = 'ConstitutionPaginationRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<ConstitutionPaginationRouteArgs>(
          orElse: () => ConstitutionPaginationRouteArgs(
                language: pathParams.getString('language'),
                title: queryParams.optInt('title'),
              ));
      return _i2.ConstitutionPaginationPage(
        key: args.key,
        language: args.language,
        title: args.title,
      );
    },
  );
}

class ConstitutionPaginationRouteArgs {
  const ConstitutionPaginationRouteArgs({
    this.key,
    required this.language,
    this.title,
  });

  final _i8.Key? key;

  final String language;

  final int? title;

  @override
  String toString() {
    return 'ConstitutionPaginationRouteArgs{key: $key, language: $language, title: $title}';
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

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.NotFoundPage]
class NotFoundRoute extends _i6.PageRouteInfo<void> {
  const NotFoundRoute({List<_i6.PageRouteInfo>? children})
      : super(
          NotFoundRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotFoundRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.NotFoundPage();
    },
  );
}

/// generated route for
/// [_i5.SearchContentPage]
class SearchContentRoute extends _i6.PageRouteInfo<void> {
  const SearchContentRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SearchContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchContentRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SearchContentPage();
    },
  );
}
