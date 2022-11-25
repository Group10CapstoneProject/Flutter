import 'package:capstone_alterra_flutter/screen/auth/register_page.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
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

  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
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
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(_obscureText
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
                    )
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
              MaterialButton(
                color: primaryDark,
                height: 48,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data Tersimpan'),
                      ),
                    );
                  }
                },
                child: Text(
                  'MASUK',
                  style: kButton.copyWith(color: whiteBase)
                ),
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
      ),
    );
  }
}
