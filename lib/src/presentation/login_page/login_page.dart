// ignore_for_file: sort_child_properties_last

import 'package:event_app/src/presentation/login_page/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:event_app/utilities/constants.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
                Color(0xFFBCD0F5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            )),
          ),
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'SIGN IN',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: controller.formKey,
                    child: Column(children: [
                      _boxEmail(),
                      const SizedBox(
                        height: 10,
                      ),
                      _boxPassword(),
                      const SizedBox(
                        height: 20,
                      ),
                      _rememberMeCheckbox(),
                      const SizedBox(
                        height: 20,
                      ),
                      _buttonLogin(),
                    ]),
                  ),

                  // _forgotPassword(),
                ],
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: Container(
      //     color: Color(0xFFBCD0F5),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Image.asset('images/logo-cty.png', height: 150),
      //         Image.asset('images/logo-ims.png', height: 60),
      //       ],
      //     )),
    );
  }

  Widget _boxEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   'Email',
        //   style: kLabelStyle,
        // ),
        // SizedBox(
        //   height: 5,
        // ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextFormField(
            controller: controller.emailController,
            validator: (value) => controller.onValidationUserName(value),
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _boxPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   'Password',
        //   style: kLabelStyle,
        // ),
        // SizedBox(
        //   height: 5,
        // ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextFormField(
            controller: controller.passwordController,
            validator: (value) => controller.onValidationPassword(value),
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your password',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _forgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => debugPrint('forgot'),
        child: const Text(
          'Forgot Password',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _rememberMeCheckbox() {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Obx(() => Checkbox(
                    value: controller.rememberMe.value,
                    checkColor: Colors.green,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      controller.rememberMe.value = value!;
                    },
                  ))),
          const Text(
            'Remember me',
            style: kLabelStyle,
          )
        ],
      ),
    );
  }

  Widget _buttonLogin() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => controller.onclickLoginbtn(),
        child: const Text(
          'LOGIN',
          style: kButtonLogin,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ))),
      ),
    );
  }
}
