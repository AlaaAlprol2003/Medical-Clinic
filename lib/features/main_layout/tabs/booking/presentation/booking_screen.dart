import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medical_clinic/core/resources/assets_manager.dart';
import 'package:medical_clinic/core/resources/colors_manager.dart';
import 'package:medical_clinic/core/widgets/custom_elevated_button.dart';
import 'package:medical_clinic/core/widgets/custom_text_form_field.dart';

import 'package:medical_clinic/features/main_layout/tabs/home/widgets/custom_appbar.dart';
import 'package:medical_clinic/features/main_layout/tabs/home/widgets/welcome_section.dart';

import '../../../../booking/domain/entities/booking_entity.dart';
import '../../../../booking/presentation/cubit/booking_cubit.dart';
import '../../../../booking/presentation/cubit/booking_state.dart';
import '../appointment_helper/appointment_helper.dart';
import '../widgets/patient_info_card.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  late final List<DateTime> availableDays;

  @override
  void initState() {
    super.initState();

    availableDays = AppointmentHelper.getAvailableDays();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentState>(
      listener: (context, state) {
        if (state is AppointmentBooked) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('تم حجز الموعد بنجاح')));

          _nameController.clear();
          _phoneController.clear();
          context
              .read<AppointmentCubit>()
              .resetBooking();
        }

        if (state is AppointmentError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final cubit = context.read<AppointmentCubit>();

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  WelcomeSection(
                    userName: "حجز موعدك",
                    subtitle: "احجز موعدك الآن مع د/ رحاب العشري",
                  ),

                  SizedBox(height: 16.h),

                  /// بيانات المريض
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

                      DropdownButtonFormField<String>(
                        value: cubit.selectedVisitType,
                        decoration: const InputDecoration(
                          labelText: 'نوع الكشف',
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'كشف كبار',
                            child: Text('كشف كبار'),
                          ),
                          DropdownMenuItem(
                            value: 'كشف أطفال',
                            child: Text('كشف أطفال'),
                          ),
                          DropdownMenuItem(
                            value: 'إعادة',
                            child: Text('إعادة'),
                          ),
                        ],
                        onChanged: (value) {
                          cubit.changeVisitType(value);
                        },
                      ),

                      SizedBox(height: 12.h),

                      if (cubit.selectedPrice > 0)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Text(
                            'سعر الكشف : ${cubit.selectedPrice.toInt()} جنيه',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  /// الموعد
                  PatientInfoCard(
                    title: 'الموعد',
                    icon: Icons.calendar_today,
                    children: [
                      SizedBox(
                        height: 90.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: availableDays.length,
                          itemBuilder: (context, index) {
                            final day = availableDays[index];

                            final isSelected = cubit.selectedDay == day;

                            return GestureDetector(
                              onTap: () {
                                cubit.selectDay(day);
                              },
                              child: Container(
                                width: 110.w,
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(color: ColorsManager.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppointmentHelper.getArabicDayName(day),
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      '${day.day}/${day.month}/${day.year}',
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 16.h),

                      if (cubit.selectedDay != null)
                        DropdownButtonFormField<String>(
                          value: cubit.selectedTime,
                          decoration: const InputDecoration(
                            labelText: 'اختر الموعد',
                            border: OutlineInputBorder(),
                          ),
                          items: cubit.availableTimes
                              .map(
                                (time) => DropdownMenuItem(
                                  value: time,
                                  child: Text(time),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            cubit.selectTime(value);
                          },
                        ),
                    ],
                  ),

                  SizedBox(height: 24.h),
                  Container(
                    width: 400.w,
                    height: 250.h,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: ColorsManager.grey),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'ملاحظات هامة',
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.info_outline,
                                color: Colors.green,
                              ),
                            ],
                          ),

                          SizedBox(height: 12.h),

                          Text(
                            ':سعر الكشف شامل',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorsManager.black,
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Text(
                            ' الكشف',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: ColorsManager.black,
                            ),
                          ),

                          Text(
                            ' رسم القلب',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: ColorsManager.black,
                            ),
                          ),

                          Text(
                            ' أشعة إيكو القلب',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: ColorsManager.black,
                            ),
                          ),

                          SizedBox(height: 12.h),

                          Text(
                            'دفع تكلفة الكشف يكون في العيادة عند السكرتارية',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.black,
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                  SizedBox(height: 16.h,),

                  if (state is AppointmentLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      child: CustomElevatedButton(
                        text: 'تأكيد الحجز',
                        onPressed: () async {
                          if (cubit.selectedVisitType == null ||
                              cubit.selectedDay == null ||
                              cubit.selectedTime == null) {
                            return;
                          }

                          final date =
                              '${cubit.selectedDay!.year}-${cubit.selectedDay!.month.toString().padLeft(2, '0')}-${cubit.selectedDay!.day.toString().padLeft(2, '0')}';

                          final appointment = AppointmentEntity(
                            id: DateTime.now().millisecondsSinceEpoch
                                .toString(),
                            patientName: _nameController.text,
                            phone: _phoneController.text,
                            appointmentType: cubit.selectedVisitType!,
                            date: date,
                            time: cubit.selectedTime!,
                            price: cubit.selectedPrice,
                          );

                          await cubit.bookAppointment(appointment);

                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
