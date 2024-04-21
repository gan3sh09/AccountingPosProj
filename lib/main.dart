import 'package:accounting_pos_project/core/services/auth_provider.dart';
import 'package:accounting_pos_project/theme/texts.dart';
import 'package:accounting_pos_project/ui/views/home.dart';
import 'package:accounting_pos_project/ui/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authProvider = AuthProvider();
  final bool isLoggedIn = await authProvider.checkLoginStatus();
  runApp(MyApp(
    authProvider: authProvider,
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {required this.authProvider, required this.isLoggedIn, super.key});

  final AuthProvider authProvider;
  final bool isLoggedIn;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Accounting_pos_Project',
        home: isLoggedIn ? const HomeDashboardScreen() : const WelcomeScreen(),
        theme: ThemeData(
          textTheme: const TextTheme(
              titleMedium: secondaryListTitle,
              titleSmall: secondaryCategoryDesc,
              bodyMedium: secondaryListDisc,
              bodySmall: secondaryListTitle2),
        ),
      ),
    );
  }
}
