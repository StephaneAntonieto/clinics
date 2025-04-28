import 'package:asyncstate/class/async_overlay.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final class ClinicsLoader extends AsyncOverlay {
  ClinicsLoader()
    : super(
        id: 0,
        builder: (context, settings) {
          return Center(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * .8,
              child: LoadingAnimationWidget.inkDrop(
                color: Colors.orange,
                size: 50,
              ),
            ),
          );
        },
      );
}
