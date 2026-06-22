import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_clinic/core/widgets/custom_elevated_button.dart';
import 'package:medical_clinic/features/main_layout/tabs/booking/widgets/patient_info_card.dart';
import 'package:medical_clinic/features/main_layout/tabs/home/widgets/welcome_section.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../home/widgets/custom_appbar.dart';
import '../appointment_helper/appointment_helper.dart';

class BookingScreen extends StatefulWidget {

  BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  String? selectedVisitType;

  late final List<DateTime> availableDays;

  DateTime? selectedDay;
  String? selectedTime;

  @override
  void initState() {
    super.initState();
    availableDays = AppointmentHelper.getAvailableDays();
  }

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
          padding: EdgeInsets.only(bottom: 120, top: 10, right: 8, left: 8),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                WelcomeSection(
                  userName: "حجز موعدك",
                  subtitle: "احجز موعدك الآن مع د/ رحاب العشري",
                ),
                SizedBox(height: 16.h),
                PatientInfoCard(
                  title: 'بيانات المريض',
                  icon: Icons.person,
                  children: [
                    CustomTextFormField(
                      controller: _nameController,
                      hint: 'ادخل اسمك',
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: _phoneController,
                      hint: 'ادخل رقم الهاتف',
                    ),
                    SizedBox(height: 16.h),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButtonFormField<String>(
                        hint: Text('نوع الكشف'),
                        value: selectedVisitType,
                        dropdownColor: Colors.white,
                        style: TextStyle(
                          color: ColorsManager.black,
                          fontSize: 16.sp,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: ColorsManager.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: ColorsManager.grey),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'كشف كبار',
                            alignment: Alignment.centerRight,
                            child: Text('كشف كبار'),
                          ),
                          DropdownMenuItem(
                            value: 'كشف أطفال',
                            alignment: Alignment.centerRight,
                            child: Text('كشف أطفال'),
                          ),
                          DropdownMenuItem(
                            value: 'إعادة',
                            alignment: Alignment.centerRight,
                            child: Text('إعادة'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                PatientInfoCard(
                  title: 'الموعد',
                  icon: Icons.calendar_today,
                  children: [
                    DropdownButtonFormField<DateTime>(
                      value: selectedDay,
                      decoration: const InputDecoration(
                        labelText: 'اختر اليوم',
                        border: OutlineInputBorder(),
                      ),
                      items: availableDays.map((date) {
                        return DropdownMenuItem<DateTime>(
                          value: date,
                          child: Text(
                            '${AppointmentHelper.getArabicDayName(date)} - ${date.day}/${date.month}/${date.year}',
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDay = value;
                          selectedTime = null;
                        });
                      },
                    ),
                    SizedBox(height: 16.h),
                    if (selectedDay != null)
                      DropdownButtonFormField<String>(
                        value: selectedTime,
                        decoration: const InputDecoration(
                          labelText: 'اختر الموعد',
                          border: OutlineInputBorder(),
                        ),
                        items: AppointmentHelper.getAvailableTimes().map((time) {
                          return DropdownMenuItem<String>(
                            value: time,
                            child: Text(time),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedTime = value;
                          });
                        },
                      ),
                  ],
                ),
                CustomElevatedButton(onPressed: (){}, text: 'تأكيد الحجز')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
