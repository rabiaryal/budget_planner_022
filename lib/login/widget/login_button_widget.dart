// import 'package:budget_planner/Utils/components/round_button.dart';
// import 'package:budget_planner/Utils/utils.dart';
// import 'package:budget_planner/Utils/validator/app_validator.dart';
// import 'package:budget_planner/route/routename.dart';
// import 'package:flutter/material.dart';


// class LoginButtonWidget extends StatelessWidget {
//   const LoginButtonWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LoginViewModel>(
//         builder: (context, provider, child){
//           return RoundButton(
//             title: 'Login',
//             loading: provider.loginLoading ? true : false,
//             onPress: (){

//               if(provider.email.isEmpty){
//                 Utils.flushBarErrorMessage('Please enter email', context);
//               }else if(!AppValidator.emailValidator(provider.email.toString())){
//                 Utils.flushBarErrorMessage('Please enter valid email', context);
//               }else if(provider.password.isEmpty){
//                 Utils.flushBarErrorMessage('Please enter password', context);
//               }else if(provider.password.length < 6){
//                 Utils.flushBarErrorMessage('Please enter 6 digit password', context);
//               }else {


//                 Map data = {
//                   'email' : provider.email.toString(),
//                   'password' : provider.password.toString(),
//                 };

//                 // Map data = {
//                 //   'email' : 'eve.holt@reqres.in',
//                 //   'password' : 'cityslicka',
//                 // };

//               provider.loginApi(data).then((value){
//                 Navigator.pushNamed(context, RoutesName.home);
//               }).onError((error, stackTrace){
//                 Utils.flushBarErrorMessage(error.toString(), context);
//               });

//               }
//             },
//           );
//         }
//     );
//   }
// }