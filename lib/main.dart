import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:test/index.dart';
import 'package:test/pages/analytics_screen.dart';
import 'package:test/pages/background/background_widget.dart';
import 'package:test/pages/home_page/home_page_widget.dart';
import 'package:test/pages/profile/profile_widget.dart';
import 'package:test/pages/rest_password/reset_password_page_widget.dart';
import 'package:test/pages/send_notifications/send_notifications_widget.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';
// Assuming firebase_config.dart is correctly configured for Firebase initialization.
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/nav/nav.dart';
import 'pages/calendar_screen.dart';
import 'pages/home_page/home_page_widget.dart';
import 'pages/profile/graphs_screen.dart'; // Ensure this import is correct.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  //await initFirebase(); // Uncommented and assuming this function initializes Firebase.
  await FlutterFlowTheme.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // Set HomePageWidget as the initial route
      home:
          GraphicalRepresentationScreen(), // Directly use HomePageWidget here.
    );
  }
}
