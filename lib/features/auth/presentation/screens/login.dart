// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_clinic/core/resources/assets_manager.dart';
import 'package:medical_clinic/core/resources/colors_manager.dart';
import 'package:medical_clinic/core/resources/ui_utils.dart';
import 'package:medical_clinic/core/resources/validators.dart';
import 'package:medical_clinic/core/routes_manager/app_routes.dart';
import 'package:medical_clinic/core/widgets/custom_elevated_button.dart';
import 'package:medical_clinic/core/widgets/custom_text_button.dart';
import 'package:medical_clinic/core/widgets/custom_text_form_field.dart';
import 'package:medical_clinic/features/auth/data/models/login_request.dart';
import 'package:medical_clinic/features/auth/presentation/cubit/auth_cubit.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      backgroundColor: ColorsManager.blueWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.logo, height: 220.h),
              SizedBox(height: 25.h),
              Container(
                width: double.infinity,
                height: 430.h,
                margin: REdgeInsets.symmetric(horizontal: 12),
                padding: REdgeInsets.symmetric(horizontal: 12, vertical: 30),

                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsManager.black.withValues(alpha: .06),

                      blurRadius: 20,

                      offset: const Offset(0, 10),

                      spreadRadius: -2,
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hint: "أدخل بريدك الالكترونى",
                          suffixIcon: Icon(
                            Icons.email,
                            color: ColorsManager.grey,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: Validator.email,
                        ),
                        SizedBox(height: 16.h),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return CustomTextFormField(
                              hint: "أدخل كلمة المرور",
                              isSecured: cubit.securePassword,
                              preIcon: InkWell(
                                onTap: () {
                                  cubit.changePasswordVisibility();
                                },
                                child: Icon(
                                  cubit.securePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: ColorsManager.grey,
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              controller: _passwordController,
                              validator: Validator.password,
                            );
                          },
                        ),
                        SizedBox(height: 24.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CustomTextButton(
                            onPressed: () {},
                            text: "نسيت كلمة المرور ؟",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        BlocListener<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state is LoginLoadingState) {
                              UiUtils.showLoading(context: context);
                            } else if (state is LoginFailureState) {
                              UiUtils.hideLoading(context: context);
                              UiUtils.showMessage(
                                context: context,
                                message: state.message,
                                bgColor: Colors.red,
                                fgColor: ColorsManager.blueWhite,
                              );
                            } else if (state is LoginSuccessState) {
                              UiUtils.hideLoading(context: context);
                              UiUtils.showMessage(
                                context: context,
                                message: "تم تسجيل الدخول بنجاح",
                                bgColor: ColorsManager.blue,
                                fgColor: Colors.white,
                              );
                              cubit.resetAuthState();
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.main_layout,
                              );
                            }
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 70.h,
                            child: CustomElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() == false)
                                  return;
                                cubit.login(
                                  request: LoginRequest(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              },
                              text: "تسجيل الدخول",
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.register,
                                );
                              },
                              text: "سجل الأن",
                            ),
                            Text(
                              "ليس لديك حساب ؟",
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.notoSansArabic(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorsManager.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
