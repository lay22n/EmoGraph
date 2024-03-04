import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'reset1_model.dart';
export 'reset1_model.dart';

class Reset1Widget extends StatefulWidget {
  const Reset1Widget({super.key});

  @override
  State<Reset1Widget> createState() => _Reset1WidgetState();
}

class _Reset1WidgetState extends State<Reset1Widget> {
  late Reset1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Reset1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'assets/images/Background.jpg',
        width: 1464.0,
        height: 900.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
