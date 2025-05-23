import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_e_commerce_app/features/auth/presentation/widgets/custom_text.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/app_regex.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class SignUpTextField extends StatefulWidget {
  const SignUpTextField({super.key, required this.onNameChanged, required this.onPhoneNumberChanged, required this.onEmailChanged, required this.onPasswordChanged, required this.onConfirmPasswordChanged});

  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onPhoneNumberChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<String> onConfirmPasswordChanged;

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Listen to password field
    passwordController.addListener(() {
      widget.onPasswordChanged(passwordController.text);
    });
    // Listen to confirm password
    confirmPasswordController.addListener(() {
      widget.onConfirmPasswordChanged(confirmPasswordController.text);
    });

    nameController.addListener(() {
      widget.onNameChanged(nameController.text);
    });

    phoneNumberController.addListener(() {
      widget.onPhoneNumberChanged(phoneNumberController.text);
    });

    emailController.addListener(() {
      widget.onEmailChanged(emailController.text);
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: "Your Name"),
        CustomTextField(
          validator: (value){
            if(value == null || value.isEmpty ) {
              return "Please enter a valid Name";
            }
            return null;
          },
          textController: nameController,
          labelText: "Full Name",
          prefixIcon: Icon(
            Icons.person_outline,
            color: AppColors.darkBlue,
          ),
        ),
        5.verticalSpace,
        CustomText(
            text: "Username "),
        CustomTextField(
          validator: (value){
            if(value == null || value.isEmpty ) {
              return "Please enter a valid Username";
            }
            return null;
          },
          textController: usernameController,
          labelText: "Username",
          prefixIcon: Icon(
            Icons.person_outline,
            color: AppColors.darkBlue,
          ),
        ),
        5.verticalSpace,
        CustomText(
            text: "Phone Number "),
        CustomTextField(
          validator: (value){
            if(value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
              return "Please enter a valid phone number";
            }
            return null;
          },
          textController: phoneNumberController,
          labelText: "+20 1501142409 ",
          prefixIcon: Icon(
            Icons.phone_iphone_outlined,
            color: AppColors.darkBlue,
          ),
        ),
        5.verticalSpace,
        CustomText(
            text:  "Email "),
        CustomTextField(
          validator: (value){
            if(value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
              return "Please enter a valid email";
            }
            return null;
          },
          textController: emailController,
          labelText: "Username or Email",
          prefixIcon: Icon(
            Icons.email_outlined,
            color: AppColors.darkBlue,
          ),
        ),
        5.verticalSpace,
        CustomText(
            text: "Password "),
        CustomTextField(
          validator: (value){
            if(value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
              return "Please enter a valid password";
            }
            return null;
          },

          textController: passwordController,
          labelText: "Password",
          prefixIcon: Icon(
            Icons.lock_outline,
            color: AppColors.darkBlue,
          ),
          isObscure: !isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
        ),
        5.verticalSpace,
        CustomText(
            text: "Confirm Password "),
        CustomTextField(
          validator: (value){
            if(value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
              return "Please enter a valid password";
            }
            return null;
          },

          textController: confirmPasswordController,
          labelText: "Confirm Password",
          prefixIcon: Icon(
            Icons.lock_outline,
            color: AppColors.darkBlue,
          ),
          isObscure: !isConfirmPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isConfirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                isConfirmPasswordVisible = !isConfirmPasswordVisible;
              },);
            },
          ),
        ),
      ],
    );
  }
}
