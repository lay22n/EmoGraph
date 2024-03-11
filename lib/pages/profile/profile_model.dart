import '/components/profilecomponent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for profilecomponent component.
  late ProfilecomponentModel profilecomponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    profilecomponentModel = createModel(context, () => ProfilecomponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    profilecomponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
