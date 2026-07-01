import 'package:flutter/material.dart';
import 'package:medical_clinic/core/model/tips_model.dart';

final List<HeartCategory> heartCategories = [
  HeartCategory(
    id: "healthy_diet",
    title: "التغذية الصحية",
    icon: Icons.restaurant,
    tips: [
      HeartTip(
        title: "تناول الخضروات والفواكه",
        description:
            "احرص على تناول خمس حصص يوميًا من الخضروات والفواكه للحصول على الفيتامينات ومضادات الأكسدة.",

      ),
      HeartTip(
        title: "اختر الحبوب الكاملة",
        description:
            "استبدل الخبز والأرز الأبيض بالشوفان والخبز الأسمر والأرز البني.",
      ),
      HeartTip(
        title: "قلل من الملح",
        description:
            "الإفراط في الملح قد يؤدي إلى ارتفاع ضغط الدم وزيادة خطر أمراض القلب.",
      ),
      HeartTip(
        title: "تناول الدهون الصحية",
        description:
            "استخدم زيت الزيتون والأفوكادو والمكسرات بدلًا من الدهون المشبعة.",
      ),
      HeartTip(
        title: "تناول الأسماك",
        description:
            "تناول الأسماك الغنية بأوميجا 3 مرتين أسبوعيًا لدعم صحة القلب.",
      ),
      HeartTip(
        title: "قلل السكريات",
        description:
            "تجنب المشروبات الغازية والحلويات للحفاظ على صحة القلب والوزن.",
      ),
      HeartTip(
        title: "اشرب الماء",
        description:
            "احرص على شرب كمية كافية من الماء للحفاظ على الدورة الدموية.",
      ),
      HeartTip(
        title: "اختر البروتين الصحي",
        description:
            "اعتمد على الدجاج والأسماك والبقوليات كمصادر رئيسية للبروتين.",
      ),
      HeartTip(
        title: "تحكم في حجم الوجبات",
        description: "تناول كميات معتدلة من الطعام لتجنب زيادة الوزن.",
      ),
      HeartTip(
        title: "تجنب الأطعمة المصنعة",
        description: "قلل من الوجبات السريعة والأطعمة الغنية بالمواد الحافظة.",
      ),
    ],
  ),

  HeartCategory(
    id: "physical_activity",
    title: "النشاط البدني",
    icon: Icons.directions_run,
    tips: [
      HeartTip(
        title: "المشي يوميًا",
        description: "امشِ لمدة 30 دقيقة على الأقل معظم أيام الأسبوع.",
      ),
      HeartTip(
        title: "استخدم السلالم",
        description: "اختر السلالم بدلًا من المصعد كلما أمكن.",
      ),
      HeartTip(
        title: "مارس تمارين القوة",
        description: "قم بتمارين المقاومة مرتين أسبوعيًا لتقوية العضلات.",
      ),
      HeartTip(
        title: "تجنب الجلوس الطويل",
        description: "قف وتحرك لمدة دقائق كل ساعة أثناء العمل أو الدراسة.",
      ),
      HeartTip(
        title: "قم بالإحماء",
        description: "ابدأ التمارين بالإحماء لتقليل خطر الإصابات.",
      ),
      HeartTip(
        title: "مارس تمارين الإطالة",
        description: "الإطالة تحسن مرونة العضلات وتقلل التشنجات.",
      ),
      HeartTip(
        title: "جرب السباحة",
        description: "السباحة من أفضل الرياضات لصحة القلب والمفاصل.",
      ),
      HeartTip(
        title: "اركب الدراجة",
        description: "ركوب الدراجة يقوي القلب ويحسن اللياقة البدنية.",
      ),
      HeartTip(
        title: "حدد أهدافًا واقعية",
        description: "ابدأ بخطوات بسيطة ثم زد مستوى النشاط تدريجيًا.",
      ),
      HeartTip(
        title: "استمتع بالنشاط",
        description: "اختر رياضة تحبها حتى تستمر في ممارستها بانتظام.",
      ),
    ],
  ),

  HeartCategory(
    id: "blood_pressure",
    title: "ضغط الدم",
    icon: Icons.monitor_heart,
    tips: [
      HeartTip(
        title: "قياس الضغط بانتظام",
        description: "راقب ضغط الدم باستمرار لاكتشاف أي ارتفاع مبكرًا.",
      ),
      HeartTip(
        title: "تقليل الملح",
        description: "خفض كمية الملح في الطعام يساعد على التحكم في ضغط الدم.",
      ),
      HeartTip(
        title: "الحفاظ على الوزن",
        description: "الوصول إلى وزن صحي يخفف العبء على القلب.",
      ),
      HeartTip(
        title: "ممارسة الرياضة",
        description: "النشاط البدني المنتظم يساعد على خفض ضغط الدم.",
     ),
      HeartTip(
        title: "تقليل التوتر",
        description: "مارس تمارين التنفس أو التأمل لتقليل التوتر.",
      ),
      HeartTip(
        title: "الإقلاع عن التدخين",
        description: "التدخين يرفع ضغط الدم ويزيد خطر الإصابة بأمراض القلب.",
      ),
      HeartTip(
        title: "النوم الكافي",
        description: "احصل على 7 إلى 9 ساعات من النوم يوميًا.",
      ),
      HeartTip(
        title: "تقليل الكافيين",
        description: "لا تفرط في تناول القهوة والمشروبات المنبهة.",
      ),
      HeartTip(
        title: "الالتزام بالعلاج",
        description: "تناول الأدوية الموصوفة من الطبيب بانتظام.",
     ),
      HeartTip(
        title: "المراجعة الطبية",
        description: "احرص على زيارة الطبيب وإجراء الفحوصات الدورية.",
      ),
    ],
  ),
  HeartCategory(
    id: "cholesterol",
    title: "الكوليسترول",
    icon: Icons.favorite,
    tips: [
      HeartTip(
        title: "تناول الألياف الغذائية",
        description:
            "احرص على تناول الشوفان، والبقوليات، والخضروات لأنها تساعد في خفض الكوليسترول الضار.",
      ),
      HeartTip(
        title: "استبدل الدهون المشبعة",
        description: "استخدم زيت الزيتون بدلًا من السمن والزبدة.",
      ),
      HeartTip(
        title: "قلل المقليات",
        description: "تجنب الأطعمة المقلية والوجبات السريعة الغنية بالدهون.",
      ),
      HeartTip(
        title: "تناول الأسماك",
        description:
            "تناول الأسماك الدهنية مثل السلمون والسردين مرتين أسبوعيًا.",
      ),
      HeartTip(
        title: "مارس الرياضة",
        description: "النشاط البدني المنتظم يساعد على رفع الكوليسترول الجيد.",
      ),
      HeartTip(
        title: "حافظ على وزن صحي",
        description: "إنقاص الوزن يساعد على تحسين مستويات الكوليسترول.",
      ),
      HeartTip(
        title: "ابتعد عن التدخين",
        description: "الإقلاع عن التدخين يحسن صحة القلب والأوعية الدموية.",
      ),
      HeartTip(
        title: "قلل الحلويات",
        description: "الإفراط في السكريات قد يزيد من الدهون الثلاثية.",
      ),
      HeartTip(
        title: "اقرأ الملصقات الغذائية",
        description: "اختر المنتجات قليلة الدهون المشبعة والدهون المتحولة.",
      ),
      HeartTip(
        title: "أجرِ فحصًا دوريًا",
        description: "تابع مستوى الكوليسترول بانتظام حسب توصية الطبيب.",
      ),
    ],
  ),

  HeartCategory(
    id: "diabetes",
    title: "السكري",
    icon: Icons.bloodtype,
    tips: [
      HeartTip(
        title: "قلل السكريات",
        description: "تجنب المشروبات الغازية والحلويات قدر الإمكان.",
      ),
      HeartTip(
        title: "اختر الحبوب الكاملة",
        description: "الحبوب الكاملة تساعد في تنظيم مستوى السكر بالدم.",
      ),
      HeartTip(
        title: "مارس الرياضة",
        description: "ممارسة النشاط البدني تحسن استجابة الجسم للأنسولين.",
      ),
      HeartTip(
        title: "حافظ على الوزن",
        description: "الوزن الصحي يقلل من خطر الإصابة بالسكري.",
      ),
      HeartTip(
        title: "اشرب الماء",
        description: "اجعل الماء هو المشروب الأساسي طوال اليوم.",
      ),
      HeartTip(
        title: "تناول وجبات منتظمة",
        description: "تنظيم مواعيد الوجبات يساعد على استقرار السكر.",
      ),
      HeartTip(
        title: "احصل على نوم كافٍ",
        description: "النوم الجيد يساعد على تنظيم الهرمونات ومستوى السكر.",
      ),
      HeartTip(
        title: "راقب مستوى السكر",
        description: "افحص مستوى السكر بانتظام إذا أوصى الطبيب بذلك.",
      ),
      HeartTip(
        title: "قلل التوتر",
        description: "التوتر قد يؤدي إلى ارتفاع مستوى السكر في الدم.",
      ),
      HeartTip(
        title: "راجع الطبيب",
        description: "قم بالفحوصات الدورية للكشف المبكر عن أي مشكلات.",
      ),
    ],
  ),

  HeartCategory(
    id: "sleep",
    title: "النوم الصحي",
    icon: Icons.bedtime,
    tips: [
      HeartTip(
        title: "نم من 7 إلى 9 ساعات",
        description: "الحصول على نوم كافٍ يدعم صحة القلب والجسم.",
      ),
      HeartTip(
        title: "ثبّت مواعيد النوم",
        description: "اذهب إلى النوم واستيقظ في نفس الموعد يوميًا.",
      ),
      HeartTip(
        title: "ابتعد عن الشاشات",
        description: "تجنب استخدام الهاتف أو التلفاز قبل النوم بساعة.",
      ),
      HeartTip(
        title: "قلل الكافيين مساءً",
        description: "تجنب القهوة والشاي في الساعات الأخيرة من اليوم.",
      ),
      HeartTip(
        title: "اجعل الغرفة مريحة",
        description: "حافظ على هدوء وإظلام غرفة النوم.",
      ),
      HeartTip(
        title: "تجنب الوجبات الثقيلة",
        description: "لا تتناول وجبات كبيرة قبل النوم مباشرة.",
      ),
      HeartTip(
        title: "مارس الاسترخاء",
        description: "اقرأ كتابًا أو مارس التنفس العميق قبل النوم.",
      ),
      HeartTip(
        title: "قلل القيلولة",
        description: "تجنب النوم لفترات طويلة خلال النهار.",
      ),
      HeartTip(
        title: "مارس الرياضة نهارًا",
        description: "النشاط البدني يحسن جودة النوم.",
      ),
      HeartTip(
        title: "استشر الطبيب عند الأرق",
        description:
            "إذا استمر الأرق لفترة طويلة فلا تتردد في طلب المساعدة الطبية.",
      ),
    ],
  ),
  HeartCategory(
    id: "stress",
    title: "إدارة التوتر",
    icon: Icons.self_improvement,
    tips: [
      HeartTip(
        title: "مارس التنفس العميق",
        description:
            "خصص بضع دقائق يوميًا لممارسة تمارين التنفس العميق لتقليل التوتر.",
      ),
      HeartTip(
        title: "جرّب التأمل",
        description: "يساعد التأمل على تهدئة العقل وخفض مستويات التوتر.",
      ),
      HeartTip(
        title: "مارس هواية تحبها",
        description: "الهوايات تساعد على تحسين المزاج والتخلص من الضغوط.",
      ),
      HeartTip(
        title: "نظم وقتك",
        description: "تنظيم المهام اليومية يقلل الشعور بالضغط.",
      ),
      HeartTip(
        title: "احصل على قسط كافٍ من النوم",
        description: "النوم الجيد يساعد الجسم والعقل على التعامل مع التوتر.",
      ),
      HeartTip(
        title: "تحدث مع شخص تثق به",
        description: "مشاركة مشاعرك مع الآخرين تساعد في تخفيف الضغوط النفسية.",
      ),
      HeartTip(
        title: "مارس الرياضة",
        description: "الرياضة تحفز إفراز هرمونات السعادة وتقلل التوتر.",
      ),
      HeartTip(
        title: "ابتعد عن الأخبار السلبية",
        description: "قلل من متابعة الأخبار التي تسبب القلق المستمر.",
      ),
      HeartTip(
        title: "مارس الامتنان",
        description: "ركز يوميًا على الأمور الإيجابية في حياتك.",
      ),
      HeartTip(
        title: "اطلب المساعدة عند الحاجة",
        description: "لا تتردد في استشارة مختص إذا كان التوتر يؤثر على حياتك.",
      ),
    ],
  ),

  HeartCategory(
    id: "hydration",
    title: "الترطيب",
    icon: Icons.water_drop,
    tips: [
      HeartTip(
        title: "اشرب كمية كافية من الماء",
        description: "احرص على شرب الماء بانتظام طوال اليوم.",
      ),
      HeartTip(
        title: "احمل زجاجة ماء",
        description: "وجود زجاجة ماء معك يساعد على تذكر الشرب باستمرار.",
      ),
      HeartTip(
        title: "اشرب قبل الشعور بالعطش",
        description: "لا تنتظر حتى تشعر بالعطش، بل اشرب الماء بشكل منتظم.",
      ),
      HeartTip(
        title: "قلل المشروبات الغازية",
        description:
            "استبدل المشروبات الغازية بالماء أو العصائر الطبيعية غير المحلاة.",
      ),
      HeartTip(
        title: "تناول الفواكه الغنية بالماء",
        description: "مثل البطيخ والبرتقال والخيار للمساعدة في ترطيب الجسم.",
      ),
      HeartTip(
        title: "زد شرب الماء في الصيف",
        description: "يفقد الجسم سوائل أكثر في الأجواء الحارة.",
     ),
      HeartTip(
        title: "اشرب بعد ممارسة الرياضة",
        description: "عوض السوائل التي فقدها جسمك أثناء التمارين.",
      ),
      HeartTip(
        title: "راقب لون البول",
        description: "اللون الفاتح غالبًا يدل على ترطيب جيد للجسم.",
      ),
      HeartTip(
        title: "قلل المشروبات السكرية",
        description: "لا تعتمد على المشروبات المحلاة كمصدر للسوائل.",
      ),
      HeartTip(
        title: "اجعل شرب الماء عادة",
        description: "اشرب كوبًا من الماء عند الاستيقاظ وقبل كل وجبة.",
      ),
    ],
  ),

  HeartCategory(
    id: "checkups",
    title: "الفحوصات",
    icon: Icons.health_and_safety,
    tips: [
      HeartTip(
        title: "قياس ضغط الدم",
        description: "افحص ضغط الدم بشكل دوري حتى في حالة عدم وجود أعراض.",
      ),
      HeartTip(
        title: "فحص الكوليسترول",
        description: "تابع مستويات الكوليسترول وفقًا لتوصيات الطبيب.",
      ),
      HeartTip(
        title: "فحص السكر",
        description: "الكشف المبكر عن السكري يساعد في الوقاية من مضاعفاته.",
      ),
      HeartTip(
        title: "زيارة الطبيب بانتظام",
        description: "لا تنتظر ظهور الأعراض لإجراء الفحص الطبي.",
      ),
      HeartTip(
        title: "معرفة التاريخ المرضي للعائلة",
        description: "يساعد ذلك في تقييم خطر الإصابة بأمراض القلب.",
      ),
      HeartTip(
        title: "متابعة الوزن",
        description: "راقب وزنك بشكل منتظم للحفاظ على صحة القلب.",
      ),
      HeartTip(
        title: "إجراء تخطيط القلب عند الحاجة",
        description: "قد يطلب الطبيب تخطيط القلب لتقييم حالتك الصحية.",
      ),
      HeartTip(
        title: "الالتزام بالأدوية",
        description: "تناول الأدوية الموصوفة في مواعيدها.",
      ),
      HeartTip(
        title: "عدم تجاهل الأعراض",
        description: "راجع الطبيب عند الشعور بألم الصدر أو ضيق التنفس.",
      ),
      HeartTip(
        title: "الوقاية خير من العلاج",
        description: "الفحص المبكر يساعد في اكتشاف المشكلات قبل تفاقمها.",
      ),
    ],
  ),

  HeartCategory(
    id: "healthy_habits",
    title: "العادات الصحية",
    icon: Icons.favorite_border,
    tips: [
      HeartTip(
        title: "الإقلاع عن التدخين",
        description: "التوقف عن التدخين من أهم الخطوات لحماية القلب.",
      ),
      HeartTip(
        title: "الحفاظ على وزن صحي",
        description: "الوزن المناسب يقلل خطر الإصابة بأمراض القلب.",
      ),
      HeartTip(
        title: "تناول وجبة الإفطار",
        description:
            "وجبة إفطار متوازنة تساعد في الحفاظ على النشاط طوال اليوم.",
      ),
      HeartTip(
        title: "اشرب الماء بانتظام",
        description: "الحفاظ على ترطيب الجسم يحسن الدورة الدموية.",
      ),
      HeartTip(
        title: "مارس الرياضة بانتظام",
        description: "اجعل النشاط البدني جزءًا من روتينك اليومي.",
      ),
      HeartTip(
        title: "قلل تناول الوجبات السريعة",
        description: "اختر الطعام الصحي بدلاً من الوجبات الغنية بالدهون.",
      ),
      HeartTip(
        title: "نم جيدًا",
        description: "النوم المنتظم يحافظ على صحة القلب والجسم.",
      ),
      HeartTip(
        title: "تجنب الجلوس الطويل",
        description: "تحرك كل فترة لتحسين الدورة الدموية.",
      ),
      HeartTip(
        title: "حافظ على صحتك النفسية",
        description: "الراحة النفسية تنعكس إيجابيًا على صحة القلب.",
      ),
      HeartTip(
        title: "اجعل العادات الصحية أسلوب حياة",
        description:
            "الاستمرار على العادات الصحية هو أفضل وسيلة للوقاية من أمراض القلب.",
      ),
    ],
  ),
];
