import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 1,
            )));
  }
}
