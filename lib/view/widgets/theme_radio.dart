import 'package:flutter/material.dart';

class ThemeRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final Function(T) onChanged;
  const ThemeRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
                child: Radio<T>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: (value) {
                    if (value != null && value != groupValue) {
                      onChanged(value);
                    }
                  },
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Text(
                title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
