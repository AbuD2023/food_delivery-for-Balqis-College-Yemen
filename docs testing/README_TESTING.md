# دليل الاختبارات الشامل - Testing Guide

## 📚 الملفات المتوفرة

### 1. [TESTING_GUIDE_AR.md](./TESTING_GUIDE_AR.md) ⭐
**دليل شامل ومفصل لكل سطر في ملفات الاختبار**

يحتوي على:
- شرح مفصل لكل سطر في ملفات الاختبار
- شرح أنواع الاختبارات (Unit, Widget, Integration)
- شرح المفاهيم الأساسية (AAA Pattern, Mocks, Matchers)
- شرح كل import وكل دالة

**مثالي لـ**: فهم عميق لكل جزء من الكود

**الحجم**: ~800 سطر - شرح مفصل جداً

---

### 2. [TESTING_EXAMPLES_AR.md](./TESTING_EXAMPLES_AR.md) ⭐
**أمثلة عملية وتوضيحات إضافية**

يحتوي على:
- أمثلة عملية كاملة (Unit Test, Widget Test)
- أخطاء شائعة وحلولها (5 أخطاء شائعة)
- أدوات مفيدة (Matchers, WidgetTester, Mockito)
- Best Practices (7 ممارسات جيدة)

**مثالي لـ**: التطبيق العملي والممارسة

**الحجم**: ~600 سطر - أمثلة عملية

---

### 3. [PRESENTATION_TESTING.md](./PRESENTATION_TESTING.md) 📊
**عرض تقديمي للمحاضرة**

يحتوي على:
- 26 شريحة جاهزة للعرض
- شرح مبسط للمفاهيم
- أمثلة مختصرة
- ملاحظات للمحاضر

**مثالي لـ**: المحاضرات والعروض التقديمية

**الحجم**: ~400 سطر - 26 شريحة

---

### 4. [TESTING_QUICK_REFERENCE.md](./TESTING_QUICK_REFERENCE.md) 📝
**مرجع سريع**

يحتوي على:
- كود سريع للنسخ واللصق
- جميع Matchers
- جميع الأوامر
- Checklist
- جدول مقارنة

**مثالي لـ**: المرجع السريع أثناء البرمجة

**الحجم**: ~300 سطر - مرجع سريع

---

## 🎯 كيفية الاستخدام

### للمحاضرة:
1. استخدم **PRESENTATION_TESTING.md** للعرض التقديمي (26 شريحة)
2. راجع **TESTING_GUIDE_AR.md** للتفاصيل الإضافية
3. استخدم **TESTING_EXAMPLES_AR.md** للأمثلة العملية
4. راجع ملفات الاختبار الفعلية في `test/` و `integration_test/`

**الوقت المقترح**: 70 دقيقة

### للطلاب:
1. ابدأ بـ **PRESENTATION_TESTING.md** لفهم المفاهيم الأساسية
2. اقرأ **TESTING_GUIDE_AR.md** للتفاصيل الشاملة
3. جرب الأمثلة في **TESTING_EXAMPLES_AR.md**
4. استخدم **TESTING_QUICK_REFERENCE.md** كمرجع سريع
5. اكتب اختبارات جديدة بناءً على ما تعلمته

### للمطورين:
1. استخدم **TESTING_QUICK_REFERENCE.md** كمرجع سريع
2. راجع **TESTING_EXAMPLES_AR.md** للأمثلة
3. راجع **TESTING_GUIDE_AR.md** عند الحاجة للتفاصيل

---

## 📖 المحتوى التفصيلي

### TESTING_GUIDE_AR.md (الدليل الشامل)
- ✅ مقدمة عن أنواع الاختبارات
- ✅ Unit Test - Domain Layer (UseCase) - **شرح كل سطر**
- ✅ Unit Test - Data Layer (Repository) - **شرح كل سطر**
- ✅ Widget Test - Presentation Layer - **شرح كل سطر**
- ✅ Integration Test - **شرح كل سطر**
- ✅ مفاهيم مهمة في الاختبارات

### TESTING_EXAMPLES_AR.md (الأمثلة العملية)
- ✅ مثال عملي: Unit Test كامل (AddToCartUsecase)
- ✅ مثال عملي: Widget Test كامل (ProductCard)
- ✅ 5 أخطاء شائعة وحلولها
- ✅ أدوات مفيدة (Matchers, WidgetTester, Mockito)
- ✅ 7 Best Practices

### PRESENTATION_TESTING.md (العرض التقديمي)
- ✅ 26 شريحة جاهزة
- ✅ شرح مبسط للمفاهيم
- ✅ أمثلة مختصرة
- ✅ ملاحظات للمحاضر
- ✅ الوقت المقترح لكل قسم

### TESTING_QUICK_REFERENCE.md (المرجع السريع)
- ✅ Unit Test - كود سريع
- ✅ Widget Test - كود سريع
- ✅ Integration Test - كود سريع
- ✅ جميع Matchers
- ✅ جميع الأوامر
- ✅ Checklist
- ✅ جدول مقارنة

---

## 🚀 البدء السريع

### 1. تشغيل الاختبارات
```bash
# جميع الاختبارات
flutter test

# اختبار محدد
flutter test test/features/home/presentation/page/home_page_test.dart

# Integration Test
flutter test integration_test/app_test.dart
```

### 2. إنشاء Mocks
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 3. Coverage Report
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

---

## 📝 ملاحظات مهمة

1. **يجب تشغيل build_runner** قبل تشغيل Unit Tests التي تستخدم Mockito
2. **Widget Tests** تحتاج `MaterialApp` و `ProviderScope` في معظم الحالات
3. **Integration Tests** تحتاج `IntegrationTestWidgetsFlutterBinding.ensureInitialized()`
4. **كل اختبار يجب أن يكون مستقل** - لا يعتمد على اختبارات أخرى

---

## 🔗 روابط مفيدة

- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [Mockito Documentation](https://pub.dev/packages/mockito)
- [Riverpod Testing](https://riverpod.dev/docs/concepts/testing)
- [Effective Dart: Testing](https://dart.dev/guides/language/effective-dart/testing)

---

## 📧 للأسئلة والاستفسارات

راجع الملفات المذكورة أعلاه أو راجع الكود الفعلي في:
- `test/features/` - Unit Tests
- `test/features/` - Widget Tests  
- `integration_test/` - Integration Tests

