// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:accounting_pos_project/core/services/auth_provider.dart';
import 'package:accounting_pos_project/theme/colors.dart';
import 'package:accounting_pos_project/ui/views/home.dart';
import 'package:accounting_pos_project/ui/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({super.key});

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: tassistWhite,
      appBar: AppBar(
        backgroundColor: tassistPrimary,
        elevation: 0.0,
        title: Text('Sign In',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: tassistWhite)),
        /* actions: <Widget>[
          TextButton.icon(
            icon: const Icon(
              Icons.person,
              color: tassistWhite,
            ),
            label: Text(
              'Register',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: tassistWhite),
            ),
            onPressed: () => widget.toggleView(),
          ),
        ], */
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _username,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please enter your username';
                  } else {
                    return null;
                  }
                },
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  icon:
                      const Icon(Icons.person, color: tassistPrimaryBackground),
                  hintText: 'Enter your username please',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _password,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  RegExp regex = RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  }
                  if (!regex.hasMatch(value)) {
                    return ("please enter valid password min. 6 character");
                  } else {
                    return null;
                  }
                },
                style: Theme.of(context).textTheme.bodyMedium,
                obscureText: true,
                decoration: InputDecoration(
                    icon: const Icon(Icons.vpn_key,
                        color: tassistPrimaryBackground),
                    hintText: 'Enter your password please',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    labelText: 'Password'),
              ),

              const SizedBox(
                height: 20.0,
              ),

              /* ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: tassistPrimaryBackground,
                  elevation: 20.0,
                ),
                onPressed: () async {
                  final username = _username.text.trim();
                  final password = _password.text.trim();

                  try {
                    final responseData =
                        await AuthenticationProvider.login(username, password);
                    final accessToken = responseData['access_token'];

                    // Save the access token locally using shared_preferences
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString('accessToken', accessToken);

                    print(responseData);

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeDashboardScreen(),
                    ));

                    // Navigate to HomeDashboard screen or do any other operation
                  } catch (e) {
                    // Handle login failure, show error message, etc.
                    print('Login failed: $e');
                  }
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ), */
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: tassistPrimaryBackground,
                  elevation: 20.0,
                ),
                onPressed: () async {
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid) return;

                  final username = _username.text.trim();
                  final password = _password.text.trim();
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: tassistPrimary,
                        ),
                      );
                    },
                  );

                  try {
                    await authProvider.login(username, password);
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeDashboardScreen(),
                    ));
                  } catch (e) {
                    // Handle login failure
                    Navigator.pop(context);
                    showMessage(
                      message: "Invalid Credentials! Please try again later.",
                      context: context,
                    );
                    print('Login failed: $e');
                  }
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              //   Text(
              //       'Have you installed the Tally Connector yet?',
              //       style: Theme.of(context)
              //       .textTheme
              //       .headline6
              //       .copyWith(fontSize: 18.0, color: TassistMainText),
              //     ),
              //     SizedBox(height: 30),
              //      RaisedButton(
              //        color: TassistBgLightPurple,
              //        child:
              //        Row(children: <Widget>[
              //       Icon(FontAwesomeIcons.laptop),
              //       SizedBox(width: 30),
              //       Text('Launch the Tally Connector website')

              //        ]),
              //     onPressed: () => _launchURL(),)
            ],
          ),
        ),
      ),
    );
  }
}
