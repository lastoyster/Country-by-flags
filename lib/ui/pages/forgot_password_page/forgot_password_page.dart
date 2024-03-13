import 'package:flags_app/core/redux/action_mapper.dart';
import 'package:flags_app/core/redux/actions/authentication_action.dart';
import 'package:flags_app/ui/components/text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulActionMapper {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
              'Lupa Password',
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
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () => widget.dispatch(
                  SubmitForgotPasswordAction(
                    _emailController.text,
                  ),
                ),
                child: const Text('Oke'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
