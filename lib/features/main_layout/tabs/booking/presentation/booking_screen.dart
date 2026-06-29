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

  String? selectedVisitType;
  DateTime? selectedDay;
  String? selectedTime;

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

          setState(() {
            selectedVisitType = null;
            selectedDay = null;
            selectedTime = null;
          });
        }

        if (state is AppointmentError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        List<String> availableTimes = [];

        if (state is AvailableTimesLoaded) {
          availableTimes = state.times;
        }

        return Scaffold(
          backgroundColor: ColorsManager.white,
          appBar: CustomAppBar(
            title: 'عيادة د/ رحاب العشري',
            logoPath: ImageAssets.logo,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 120,
                top: 10,
                right: 8,
                left: 8,
              ),
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

                      DropdownButtonFormField<String>(
                        value: selectedVisitType,
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
                          setState(() {
                            selectedVisitType = value;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  PatientInfoCard(
                    title: 'الموعد',
                    icon: Icons.calendar_today,
                    children: [
                      SizedBox(
                        height: 90,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: availableDays.length,
                          itemBuilder: (context, index) {
                            final day = availableDays[index];

                            final isSelected =
                                selectedDay == day;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDay = day;
                                  selectedTime = null;
                                });

                                final date =
                                    '${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';

                                context
                                    .read<AppointmentCubit>()
                                    .getAvailableTimes(date);
                              },
                              child: Container(
                                width: 80,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  border: Border.all(
                                    color: ColorsManager.grey,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppointmentHelper
                                          .getArabicDayName(day),
                                    ),
                                    Text(
                                      '${day.day}/${day.month}/${day.year}',
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 16.h),

                      if (selectedDay != null)
                        DropdownButtonFormField<String>(
                          value: selectedTime,
                          decoration: const InputDecoration(
                            labelText: 'اختر الموعد',
                            border: OutlineInputBorder(
                            )
                          ),
                          items: availableTimes.map((time) {
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

                  SizedBox(height: 24.h),

                  if (state is AppointmentLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      child: CustomElevatedButton(
                        text: 'تأكيد الحجز',
                        onPressed: () {
                          if (selectedDay == null ||
                              selectedTime == null ||
                              selectedVisitType == null) {
                            return;
                          }

                          final date =
                              '${selectedDay!.year}-${selectedDay!.month.toString().padLeft(2, '0')}-${selectedDay!.day.toString().padLeft(2, '0')}';

                          final appointment = AppointmentEntity(
                            patientName: _nameController.text,
                            phone: _phoneController.text,
                            appointmentType: selectedVisitType!,
                            date: date,
                            time: selectedTime!,
                            id: date,
                          );

                          context.read<AppointmentCubit>().bookAppointment(
                            appointment,
                          );
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
