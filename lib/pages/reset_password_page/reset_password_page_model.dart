import '/flutter_flow/flutter_flow_util.dart';
import '/pages/reset/reset_widget.dart';
import 'reset_password_page_widget.dart' show ResetPasswordPageWidget;
import 'package:flutter/material.dart';

class ResetPasswordPageModel extends FlutterFlowModel<ResetPasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for RESET component.
  late ResetModel resetModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    resetModel = createModel(context, () => ResetModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    resetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
