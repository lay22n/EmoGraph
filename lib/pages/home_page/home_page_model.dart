import '/flutter_flow/flutter_flow_util.dart';
import '/pages/background/background_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Background component.
  late BackgroundModel backgroundModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    backgroundModel = createModel(context, () => BackgroundModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backgroundModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
