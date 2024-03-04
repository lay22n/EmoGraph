import '/flutter_flow/flutter_flow_util.dart';
import '/pages/send_notifications/send_notifications_widget.dart';
import 'send_notification_widget.dart' show SendNotificationWidget;
import 'package:flutter/material.dart';

class SendNotificationModel extends FlutterFlowModel<SendNotificationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SendNotifications component.
  late SendNotificationsModel sendNotificationsModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sendNotificationsModel =
        createModel(context, () => SendNotificationsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sendNotificationsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
