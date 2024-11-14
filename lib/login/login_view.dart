// import 'package:budget_planner/login/widget/input_email_widget.dart';
// import 'package:budget_planner/login/widget/input_password_widget.dart';
// import 'package:budget_planner/login/widget/login_button_widget.dart';
// import 'package:flutter/material.dart';




// class LoginView extends StatefulWidget {
//   const LoginView({Key? key}) : super(key: key);

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {


//   final emailFocusNode = FocusNode();
//   final passwordFocusNode = FocusNode();

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     emailFocusNode.dispose();
//     passwordFocusNode.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               InputEmailWidget(focusNode: emailFocusNode, passwordFocusNode: passwordFocusNode),
//               InputPasswordWidget(focusNode: passwordFocusNode),
//               SizedBox(height:  MediaQuery.of(context).size.height * 0.085),
//               const LoginButtonWidget(),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }