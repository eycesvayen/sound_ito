import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:sound_ito/models/login_page_model.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPageModel loginPageModel = LoginPageModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});
  void login(BuildContext context, String email, String password) {
    loginPageModel.login(context, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş Yapın"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildEmailTextField(),
          const SizedBox(height: 16),
          _buildPasswordTextField(),
          const SizedBox(height: 16),
          ElevatedButton(
              child: const Text("Giriş Yapın!"),
              onPressed: () {
                loginPageModel.login(
                    context, _emailController.text, _passwordController.text);
                //setState() {}
              })
        ],
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
        controller: _emailController,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("e-mail")));
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("şifre"),
      ),
    );
  }
}
