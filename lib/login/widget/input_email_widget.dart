// import 'package:budget_planner/Utils/utils.dart';
// import 'package:flutter/material.dart';



// class InputEmailWidget extends StatelessWidget {
//   final FocusNode focusNode , passwordFocusNode;
//   const InputEmailWidget({Key? key ,required this.focusNode , required this.passwordFocusNode}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LoginViewModel>(
//         builder: (context, provider, child){
//           return TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             focusNode: focusNode,
//             decoration: const InputDecoration(
//                 hintText: 'Email',
//                 labelText: 'Email',
//                 prefixIcon: Icon(Icons.alternate_email)
//             ),
//             onFieldSubmitted: (value){
//               Utils.fieldFocusChange(context, focusNode, passwordFocusNode);
//             },
//             onChanged: (value){
//               provider.setEmail(value);
//             },
//           );
//         }
//     );
//   }
// }