import 'package:book_swapping/modelview/firebase/user/logarUsuarioFirebase.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'loadings/loadingAnimations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: GradientText(
              'Clube do Livro',
              style: TextStyle(
                fontSize: 40.0,
              ),
              gradientType: GradientType.linear,
              radius: 2.5,
              colors: [
                Color(0xD800FFBB),
                Colors.greenAccent,
              ],
            ),
          ),
          if (_isLoading)
            Container(
              child: LoadingAnimations(
                cor: Colors.white,
              ),
            ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.greenAccent.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 9,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: TextFormField(
              controller: _emailController,
              validator: MultiValidator(
                [
                  RequiredValidator(errorText: 'E-mail é obrigatório'),
                  EmailValidator(errorText: 'Insira um e-mail válido'),
                ],
              ),
              decoration: InputDecoration(
                hintText: 'E-mail',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.greenAccent.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 9,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: TextFormField(
              controller: _passwordController,
              obscureText: _isObscure,
              validator: MultiValidator(
                [
                  RequiredValidator(errorText: 'Senha é obrigatória'),
                  MinLengthValidator(6,
                      errorText: 'A senha deve ter pelo menos 6 caracteres'),
                ],
              ),
              decoration: InputDecoration(
                hintText: 'Senha',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                suffixIcon: GestureDetector(
                  child: Icon(Icons.remove_red_eye),
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Get.toNamed('/recoveryPass');
            },
            child: Text(
              'Esqueceu a senha?',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _isLoading = true;
                });
                await logarUsuarioFirebase(
                    _emailController.text, _passwordController.text);
                Get.offAllNamed('/signed');
                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: Text('Logar'),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Get.toNamed('/register');
            },
            child: Text(
              'Não tem conta? Registre-se agora',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
