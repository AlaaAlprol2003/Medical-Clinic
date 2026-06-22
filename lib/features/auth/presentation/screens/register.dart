import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_clinic/core/resources/assets_manager.dart';
import 'package:medical_clinic/core/resources/colors_manager.dart';
import 'package:medical_clinic/core/resources/validators.dart';
import 'package:medical_clinic/core/routes_manager/app_routes.dart';
import 'package:medical_clinic/core/widgets/custom_elevated_button.dart';
import 'package:medical_clinic/core/widgets/custom_text_button.dart';
import 'package:medical_clinic/core/widgets/custom_text_form_field.dart';
import 'package:medical_clinic/features/auth/presentation/cubit/auth_cubit.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
          padding: REdgeInsets.symmetric(vertical: 35),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.logo, height: 220.h),
                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  height: 500.h,
                  margin: REdgeInsets.symmetric(horizontal: 16),
                  padding: REdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hint: "ألاسم كامل",
                        suffixIcon: Icon(
                          Icons.person,
                          color: ColorsManager.grey,
                        ),
                        controller: _nameController,
                        validator: Validator.name,
                      ),
                      SizedBox(height: 12.h),
                      CustomTextFormField(
                        hint: "البريد الإلكتروني",
                        suffixIcon: Icon(
                          Icons.email,
                          color: ColorsManager.grey,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: Validator.email,
                      ),
                      SizedBox(height: 12.h),
                      CustomTextFormField(
                        hint: "رقم الهاتف",

                        suffixIcon: Icon(
                          Icons.phone,
                          color: ColorsManager.grey,
                        ),
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        validator: Validator.phone,
                      ),
                      SizedBox(height: 12.h),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return CustomTextFormField(
                            hint: "كلمة المرور",
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
                      SizedBox(height: 16.h),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return CheckboxMenuButton(
                            value: cubit.isChecked,
                            onChanged: (value) {
                              cubit.changeCheckState(value: value ?? false);
                            },
                            child: Text(
                              "اوافق على شروط الخدمة وسياسة الخصوصية",
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.notoSansArabic(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorsManager.black,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        height: 60.h,
                        child: Padding(
                          padding: REdgeInsets.symmetric(horizontal: 12.0),
                          child: CustomElevatedButton(
                            onPressed: () {},
                            text: "انشاء حساب",
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.login);
                            },
                            text: "تسجيل الدخول بدلا من ذلك",
                          ),
                          Text(
                            "لديك حساب بالفعل؟ ",
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.notoSansArabic(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorsManager.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "برمجة وتطوير",
                      style: GoogleFonts.roboto(
                        color: ColorsManager.blue,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      " علاء أحمد & عمر تامر",
                      style: GoogleFonts.roboto(
                        color: ColorsManager.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
