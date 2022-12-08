import 'package:capstone_alterra_flutter/model/signup_model.dart';
import 'package:capstone_alterra_flutter/screen/auth/login_page.dart';
import 'package:capstone_alterra_flutter/service/users_service.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/widget/circular_loading.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late ValueNotifier<bool> _obscureText;
  late ValueNotifier<bool> _isLoading;

  @override
  void initState() {
    _obscureText = ValueNotifier<bool>(true);
    _isLoading = ValueNotifier<bool>(false);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Image(
                      alignment: Alignment.topLeft,
                      image: AssetImage('assets/logo.png'),
                      height: 62,
                      width: 84,
                    ),
                  ),
                  Text.rich(
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
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      'Yuk daftar dan mulai gaya hidup sehatmu\nbersama Altagym',
                      style: kBody2),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: ksubtitle,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                              hintText: 'Nama Lengkap'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Masukan Nama!';
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
                          'Email Address',
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
                              hintText: 'Contoh : kelompok10@gmail.com'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Masukan Email!';
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Masukan email yang valid!");
                            }
                            return null;
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
                                    hintText: '****'),
                                validator: (value) {
                                  RegExp regex = RegExp(r'^.{6,}$');
                                  if (value!.isEmpty) {
                                    return ("Masukan Password!");
                                  }
                                  if (!regex.hasMatch(value)) {
                                    return ("Masukkan Kata Sandi yang Valid (Min. 6 Karakter)");
                                  }
                                  return null;
                                },
                              );
                            })
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Confirm Password',
                          style: ksubtitle,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        ValueListenableBuilder<bool>(
                            valueListenable: _obscureText,
                            builder: (context, value, child) {
                              return TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: _obscureText.value,
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
                                    hintText: '****'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("Masukan Ulang Password !");
                                  }
                                  if (_confirmPasswordController.text !=
                                      _passwordController.text) {
                                    return "Kata sandi tidak cocok";
                                  }
                                  return null;
                                },
                              );
                            })
                      ],
                    ),
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
                        UsersService usersService = UsersService();
                        SignupModel model =
                            await usersService.postSignupNewUser(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text);
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(model.message.toString()),
                            ),
                          );
                          if (model.statusCode == 200) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          }
                        }
                        _isLoading.value = false;
                      }
                    },
                    child: Text(
                      'DAFTAR',
                      style: kButton.copyWith(color: whiteBase),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah memiliki akun? Klik ',
                        style: kSubtitle2,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text('Disini ',
                            style: kSubtitle2.copyWith(
                              color: primaryBase,
                              decoration: TextDecoration.underline,
                            )),
                      ),
                      Text(
                        'untuk masuk',
                        style: kSubtitle2,
                      )
                    ],
                  )
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _isLoading,
              builder: (context, value, child) {
                return (value)
                    ? const Positioned.fill(child: CircularLoading())
                    : const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
