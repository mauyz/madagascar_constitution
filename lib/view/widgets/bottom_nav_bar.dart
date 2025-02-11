import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_constitution/viewmodel/opacity_view_model.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  final List<Widget> items;
  final int currentItem;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.items,
    required this.currentItem,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 1000,
      ),
      vsync: this,
    );

    Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller).addListener(() {
      context.read<OpacityViewModel>().setValue(_controller.value);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.reset();
      _controller.forward();
    });
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withValues(
          alpha: Theme.of(context).brightness == Brightness.dark ? 0.3 : 0.8,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            100,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.items.indexed.map(
          (e) {
            bool selected = widget.currentItem == e.$1;
            final child = TextButton(
              style: TextButton.styleFrom(
                backgroundColor: (selected && widget.items.length > 1)
                    ? Colors.red.withValues(
                        alpha: Theme.of(context).brightness == Brightness.dark
                            ? 0.3
                            : 0.7,
                      )
                    : null,
              ),
              onPressed: () {
                if (!selected) {
                  widget.onTap.call(e.$1);
                  _controller.reset();
                  _controller.forward();
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: kIsWeb ? 10.0 : 2.0,
                  horizontal: 12.0,
                ),
                child: DefaultTextStyle.merge(
                  style: TextStyle(
                    color: selected
                        ? (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.green
                            : Colors.white
                        : (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.white
                            : Colors.black,
                  ),
                  child: e.$2,
                ),
              ),
            );
            return Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth > 600 ? 40.0 : 0.0,
                ),
                child: selected
                    ? Consumer<OpacityViewModel>(
                        builder: (_, opacityModel, __) {
                          return Opacity(
                            opacity: opacityModel.value,
                            child: child,
                          );
                        },
                      )
                    : child,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
