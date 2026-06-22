import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_clinic/core/resources/assets_manager.dart';
import 'package:medical_clinic/core/resources/colors_manager.dart';
import 'package:medical_clinic/features/main_layout/tabs/home/widgets/working_hours_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_elevated_button.dart';
import '../widgets/clinic_location_card.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/doctor_biography_card.dart';
import '../widgets/welcome_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: CustomAppBar(
            title: 'عيادة د/ رحاب العشري',
            logoPath: ImageAssets.logo,
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 120.h,
            top: 10.h,
            right: 8.w,
            left: 8.w,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                WelcomeSection(
                  userName: "مرحباً, عمر",
                  subtitle: "مرحباً بك مجدداً فى عيادتك المفضلة",
                ),

                SizedBox(height: 16.h),
                DoctorCard(
                  imagePath: ImageAssets.doctor,
                  doctorName: 'د/ رحاب محمود العشرى',
                  qualifications: [
                    'دكتوراة القلب و الأوعية الدموية',
                    'زميل واستشاري القلب والقسطرة وقلب الاطفال',
                  ],
                  description:
                  'مكرسون لتقديم رعاية متقدمة للقلب و الأوعية الدموية من خلال التشخيص الدقيق و دعم المرضى بلمسة انسانية\nتتخصص عيادتنا فى صحة القلب الوقائية و ادارة اضطرابات نظم القلب المعقدة',
                ),
                SizedBox(height: 16.h),
                WorkingHoursCard(
                  title: 'مواعيد العمل',
                  days: 'السبت - الأحد - الخميس',
                  time: 'من 4:00م إلى 8:00م',
                  phoneNumber: '01554020188',
                ),
                SizedBox(height: 16.h),
                ClinicLocationCard(
                  imagePath: ImageAssets.location,
                  title: "موقع العيادة",
                  address:
                      "برج القصر الأبيض - مدخل 2 - الدور التانى علوى - أعلى صيدلية د. عبدالرحمن فريد - أمام محطة قطار الزقازيق و نفق المشاه من اتجاه شارع فاروق",
                  onDirectionsPressed: _openDirections,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _openDirections() async {
  final Uri mapsUrl = Uri.parse('google.navigation:q=30.581481,31.503058');

  if (!await launchUrl(mapsUrl, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch Maps');
  }
}
