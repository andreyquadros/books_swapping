import 'package:book_swapping/modelview/firebase/user/cadastrarUsuarioFirebase.dart';
import 'package:flutter/material.dart';

import 'components/loadings/loadingAnimations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _controladorEmail = TextEditingController();
  TextEditingController _controladorSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controladorEmail.dispose();
    _controladorSenha.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Novo Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 15, 32, 10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            if (_isLoading)
              Container(
                child: const LoadingAnimations(
                  cor: Colors.green,
                ),
              ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _controladorEmail,
              decoration: InputDecoration(
                label: Text('E-mail'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _controladorSenha,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                label: Text('Senha'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  await cadastrarUsuarioFirebase(
                      context, _controladorEmail.text, _controladorSenha.text);
                  setState(() {
                    _isLoading = false;
                  });
                },
                child: Text('Registrar'))
          ],
        ),
      ),
    );
  }
}
