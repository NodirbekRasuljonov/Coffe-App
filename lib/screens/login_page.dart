import 'package:coffeapp/provider/text_field_provider.dart';
import 'package:coffeapp/widgets/my_appbar.dart';
import 'package:coffeapp/widgets/text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          context: context,
          title: 'Cat Coffee App Log In',
          ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Lottie.asset('assets/images/coffee_cat.json'),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  margin: const EdgeInsets.all(15.0),
                  child: Form(
                    key: context.watch<MytextFieldProvider>().globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyTextField(
                          controller: context
                              .watch<MytextFieldProvider>()
                              .emailcontroller,
                          hintext: 'Email',
                        ),
                        MyTextField(
                            controller: context
                                .watch<MytextFieldProvider>()
                                .passwordcontroller,
                            hintext: 'Password'),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<MytextFieldProvider>()
                        .singIn(context: context);
                  },
                  child: const Text('Sign In'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<MytextFieldProvider>()
                        .signUp(context: context);
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
