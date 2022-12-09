import 'package:capstone_alterra_flutter/model/auth_model.dart';
import 'package:capstone_alterra_flutter/screen/auth/register_page.dart';
import 'package:capstone_alterra_flutter/screen/main/main_screen.dart';
import 'package:capstone_alterra_flutter/service/auth_service.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:capstone_alterra_flutter/widget/circular_loading.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late ValueNotifier<bool> _obscureText;
  late ValueNotifier<bool> _isLoading;

  @override
  void initState() {
    _obscureText = ValueNotifier(true);
    _isLoading = ValueNotifier(false);
    super.initState();
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
        child: Stack(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.topLeft,
                    child: const Image(
                      image: AssetImage('assets/logo.png'),
                      height: 62,
                      width: 84,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: Text.rich(
                      TextSpan(
                        text: 'Selamat Datang di',
                        style: kHeading6,
                        children: [
                          TextSpan(
                            text: ' Altagym',
                            style: kHeading6.copyWith(color: primaryDark),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      'Masuk dulu yuk biar kamu bisa ngerasain\nhidup sehat bersama Altagym',
                      style: kBody2),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: ksubtitle,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                              hintText: 'kelompok10@gmail.com'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Masukan Email!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: ksubtitle,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        ValueListenableBuilder<bool>(
                            valueListenable: _obscureText,
                            builder: (context, value, child) {
                              return TextFormField(
                                controller: _passwordController,
                                obscureText: _obscureText.value,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          _obscureText.value =
                                              !_obscureText.value;
                                        },
                                        icon: Icon(_obscureText.value
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
                                    hintText: '********'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Masukan Password!';
                                  } else {
                                    return null;
                                  }
                                },
                              );
                            })
                      ],
                    ),
                  ),
                  Text(
                    'Lupa Password ?',
                    style: kSubtitle2.copyWith(color: primaryBase),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryDark,
                      minimumSize: const Size(0, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        _isLoading.value = true;
                        AuthService authService = AuthService();
                        AuthModel model = await authService.postLoginUser(
                            email: _emailController.text,
                            password: _passwordController.text);
                        UserToken.accessToken = model.accessToken;
                        if (model.statusCode == 200) {
                          UserToken.accessToken = model.accessToken;
                          await UserToken.setRefreshToken(model.refreshToken!);
                          if (mounted) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(model.message.toString()),
                              ),
                            );
                          }
                        }
                        _isLoading.value = false;
                      }
                    },
                    child: Text('MASUK',
                        style: kButton.copyWith(color: whiteBase)),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun? ',
                        style: kSubtitle2,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: Text('Buat Akun',
                            style: kSubtitle2.copyWith(
                                color: primaryBase,
                                decoration: TextDecoration.underline)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _isLoading,
                builder: (context, value, child) {
                  return (value)
                      ? const Positioned.fill(child: CircularLoading())
                      : const SizedBox();
                })
          ],
        ),
      ),
    );
  }
}
