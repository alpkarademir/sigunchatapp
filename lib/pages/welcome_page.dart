import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigunchat/providers/auth_provider.dart';
import 'package:sigunchat/services/snackbar_service.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {

  AuthProvider _auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: ChangeNotifierProvider<AuthProvider>.value(
          value: AuthProvider.instance,
          child: _welcomePageBG(),
        ),
      ),
    );
  }

  Widget _welcomePageBG() {
    return Builder(
      builder: (BuildContext _context) {
        SnackBarService.instance.buildContext = _context;
        _auth = Provider.of<AuthProvider>(_context);
        return Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/deerbackg.png'),
          fit: BoxFit.fill
        ) ,
      ),
        );
      },
    );
  }

}