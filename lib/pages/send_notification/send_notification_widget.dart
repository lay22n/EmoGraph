import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/send_notifications/send_notifications_widget.dart';
import 'package:flutter/material.dart';
import 'send_notification_model.dart';
export 'send_notification_model.dart';

class SendNotificationWidget extends StatefulWidget {
  const SendNotificationWidget({super.key});

  @override
  State<SendNotificationWidget> createState() => _SendNotificationWidgetState();
}

class _SendNotificationWidgetState extends State<SendNotificationWidget> {
  late SendNotificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SendNotificationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.sendNotificationsModel,
            updateCallback: () => setState(() {}),
            child: const SendNotificationsWidget(),
          ),
        ),
      ),
    );
  }
}
