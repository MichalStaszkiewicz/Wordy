import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/app_router.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/screens/auth_screen/auth_form_wrapper.dart';
import 'package:wordy/presentation/widgets/button/login_button.dart';
import '../../../../utility/validator.dart';
import '../../../bloc/register/register_bloc.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm();

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
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterBloc(),
        child: AuthFormWrapper(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                translate[locator<GlobalDataManager>().interfaceLanguage]![
                    'auth_form']['create_account'],
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
                        _fullNameErrorText = translate[
                                locator<GlobalDataManager>()
                                    .interfaceLanguage]!['auth_form']
                            ['requried_field'];
                      }

                      return _fullNameErrorText;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        errorText: _fullNameErrorText,
                        prefixIcon: const Icon(Icons.person),
                        hintText: translate[locator<GlobalDataManager>()
                            .interfaceLanguage]!['auth_form']['full_name']),
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
                        return translate[locator<GlobalDataManager>()
                            .interfaceLanguage]!['auth_form']['requried_field'];
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        errorText: _emailErrorText,
                        prefixIcon: const Icon(Icons.email),
                        hintText: translate[locator<GlobalDataManager>()
                            .interfaceLanguage]!['auth_form']['email']),
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
                      return translate[locator<GlobalDataManager>()
                          .interfaceLanguage]!['auth_form']['requried_field'];
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
                    hintText: translate[locator<GlobalDataManager>()
                        .interfaceLanguage]!['auth_form']['password'],
                  ),
                ),
              ),

              LoginButton(
                label: translate[locator<GlobalDataManager>()
                    .interfaceLanguage]!['auth_form']['register'],
                onPressed: () {
                  context.read<RegisterBloc>().add((RegisterUser(
                      fullName: _fullNameController.text,
                      email: _emailController.text,
                      password: _passwordController.text)));
                  _fullNameErrorText =
                      Validator.fullNameValidate(_fullNameController.text);
                  _emailErrorText =
                      Validator.emailValidate(_emailController.text);
                  _passwordErrorText =
                      Validator.passwordValidate(_passwordController.text);
                  setState(() {});
                },
              ),
              GestureDetector(
                onTap: () {
                  context.goNamed(AppRouter.loginScreen);
                },
                child: Text(
                  translate[locator<GlobalDataManager>().interfaceLanguage]![
                      'auth_form']['already_registered'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color.fromRGBO(73, 79, 85, 1)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
