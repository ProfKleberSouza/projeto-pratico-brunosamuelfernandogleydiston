import "dart:io";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:doar_app/widgets/image/imagepicker.dart";

class AuthForm extends StatefulWidget {
  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) submitForm;

  AuthForm(this.isLoading, this.submitForm);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '', _userName = '', _userPassword = '';
  var _isLogin = true;
  late File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Escolha uma imagem'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitForm(
        _userEmail.trim(),
        _userPassword,
        _userName,
        _userImageFile,
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (!_isLogin) UserImagePicker(_pickedImage),
                  TextFormField(
                    key: ValueKey('email'),
                    autocorrect: false,
                    enableSuggestions: _isLogin,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Entre com um email válido';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _userEmail = newValue!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'E-mail'),
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      autocorrect: true,
                      textCapitalization: TextCapitalization.words,
                      enableSuggestions: false,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'Pelo menos 3 caracteres';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _userName = newValue!;
                      },
                      decoration: InputDecoration(labelText: 'Nome do usuário'),
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'A senha deve ter pelo menos 7 caracteres';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _userPassword = newValue!;
                    },
                    decoration: InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      child: Text(_isLogin ? 'Conecte-se' : 'Inscrever-se'),
                      onPressed: () {
                        setState(() {});
                        _trySubmit();
                      },
                    ),
                  if (!widget.isLoading)
                    TextButton(
                      child: Text(_isLogin
                          ? 'Criar nova conta'
                          : 'Eu já tenho uma conta'),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                          _formKey.currentState!.reset();
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
