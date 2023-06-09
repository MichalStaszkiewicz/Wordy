import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import '../../utility/validator.dart';
import '../bloc/register/register_bloc.dart';
import 'login_button.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({super.key, required this.onSwitchToLogin});
  VoidCallBack onSwitchToLogin;
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;
  String? _fullNameErrorText;
  String? _emailErrorText;
  String? _passwordErrorText;
  @override
  void initState() {
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Sign-Up',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        //full name
        SizedBox(
            width: 250,
            height: 50,
            child: TextFormField(
              controller: _fullNameController,
              validator: (value) {
                if (value == null || value == "") {
                  _fullNameErrorText = "This field is required";
                }

                return _fullNameErrorText;
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  errorText: _fullNameErrorText,
                  prefixIcon: const Icon(Icons.person),
                  hintText: "Full Name"),
            )),
        //email
        SizedBox(
            height: 50,
            width: 250,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              validator: (value) {
                if (value != null) {
                  Validator.emailValidate(value);
                } else {
                  return "This field is required";
                }
                return null;
              },
              decoration: InputDecoration(
                  errorText: _emailErrorText,
                  prefixIcon: const Icon(Icons.email),
                  hintText: "Email"),
            )),

        //password
        SizedBox(
          height: 50,
          width: 250,
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: _obscurePassword,
            controller: _passwordController,
            validator: (value) {
              if (value != null) {
                Validator.passwordValidate(value);
              } else {
                return "This field is required";
              }
              return null;
            },
            decoration: InputDecoration(
              errorText: _passwordErrorText,
              suffix: IconButton(
                  onPressed: () {
                    if (_obscurePassword == false) {
                      _obscurePassword = true;
                    } else {
                      _obscurePassword = false;
                    }
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove_red_eye)),
              prefixIcon: const Icon(Icons.password),
              hintText: "Password",
            ),
          ),
        ),

        LoginButton(
          label: 'Register',
          onPressed: () {
            context.read<RegisterBloc>().add((RegisterUser(
                fullName: _fullNameController.text,
                email: _emailController.text,
                password: _passwordController.text)));
            _fullNameErrorText =
                Validator.fullNameValidate(_fullNameController.text);
            _emailErrorText = Validator.emailValidate(_emailController.text);
            _passwordErrorText =
                Validator.passwordValidate(_passwordController.text);
            setState(() {});
          },
        ),
        GestureDetector(
          onTap: widget.onSwitchToLogin,
          child: const Text(
            textAlign: TextAlign.center,
            'Already registered ? Log-in',
            style: TextStyle(color: Color.fromRGBO(73, 79, 85, 1)),
          ),
        )
      ],
    );
  }
}
