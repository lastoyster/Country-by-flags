import 'package:flags_app/core/models/authentication/form_login.dart';
import 'package:flags_app/core/redux/action_mapper.dart';
import 'package:flags_app/core/redux/actions/authentication_action.dart';
import 'package:flags_app/core/redux/actions/navigation_action.dart';
import 'package:flags_app/ui/components/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulActionMapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Visibility(
              visible: Navigator.canPop(context),
              child: Align(
                alignment: Alignment.topLeft,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Masuk Akun',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            DefaultTextField(
              controller: _emailController,
              title: 'Email',
              hint: 'Masukkan email',
              margin: const EdgeInsets.only(top: 20),
            ),
            PasswordField(
              controller: _passwordController,
              margin: const EdgeInsets.only(top: 20),
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => widget.dispatch(
                  const NavigateToNextAction(
                    '/forgot-password',
                  ),
                ),
                child: const Text('Lupa password'),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () => widget.dispatch(
                  SubmitLoginAction(
                    login: FormLogin(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ),
                ),
                child: const Text('Masuk'),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Belum mempunyai akun? '),
                    TextSpan(
                      text: 'Daftar sekarang',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => widget.dispatch(
                              const NavigateToNextAction('/register'),
                            ),
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
