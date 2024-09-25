import 'package:flutter/material.dart';
import 'package:madagascar_constitution/viewmodel/article_list_type_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TypeViewButton extends StatelessWidget {
  final bool isPageInitial;
  const TypeViewButton({
    super.key,
    required this.isPageInitial,
  });

  @override
  Widget build(BuildContext context) {
    return (!isPageInitial && MediaQuery.sizeOf(context).width >= 600)
        ? Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Consumer<ArticleListTypeViewModel>(
              builder: (_, listTypeViewModel, __) {
                return IconButton(
                  onPressed: () {
                    listTypeViewModel.toogleType();
                    context.read<SharedPreferences>().setBool(
                          "typeView",
                          listTypeViewModel.isGrid,
                        );
                  },
                  icon: Icon(
                    listTypeViewModel.isGrid ? Icons.list : Icons.grid_view,
                  ),
                );
              },
            ),
          )
        : const SizedBox.shrink();
  }
}
