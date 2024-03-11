import '/flutter_flow/flutter_flow_util.dart';
import 'profilecomponent_widget.dart' show ProfilecomponentWidget;
import 'package:flutter/material.dart';

class ProfilecomponentModel extends FlutterFlowModel<ProfilecomponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for editname widget.
  FocusNode? editnameFocusNode1;
  TextEditingController? editnameController1;
  String? Function(BuildContext, String?)? editnameController1Validator;
  // State field(s) for editname widget.
  FocusNode? editnameFocusNode2;
  TextEditingController? editnameController2;
  String? Function(BuildContext, String?)? editnameController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editnameFocusNode1?.dispose();
    editnameController1?.dispose();

    editnameFocusNode2?.dispose();
    editnameController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
