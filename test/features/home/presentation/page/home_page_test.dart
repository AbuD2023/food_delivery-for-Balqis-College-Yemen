// ============================================================================
// WIDGET TEST - PRESENTATION LAYER
// ============================================================================
// هذا الملف يختبر Widget في طبقة Presentation
// Widget: عنصر واجهة المستخدم (UI Component)
// Presentation Layer: طبقة العرض - الواجهة التي يراها المستخدم
// ============================================================================

// استيراد Flutter Material widgets - عناصر واجهة المستخدم
// Material: نظام تصميم من Google
// Widgets: عناصر واجهة المستخدم (Buttons, Text, etc.)
import 'package:flutter/material.dart';

// استيراد Riverpod للـ State Management
// Riverpod: مكتبة لإدارة الحالة (State Management)
// ProviderScope: widget wrapper للـ providers
// overrideWithValue(): لتجاوز (override) الـ providers في الاختبار
import 'package:flutter_riverpod/flutter_riverpod.dart';

// استيراد مكتبة الاختبار الأساسية
// flutter_test: مكتبة الاختبار في Flutter
// testWidgets(): لاختبار Widgets
// WidgetTester: أداة للتفاعل مع Widgets
// find: للبحث عن Widgets في الشجرة
// expect(): للتحقق من النتائج
import 'package:flutter_test/flutter_test.dart';

// استيراد HomePage - الـ Widget الذي نريد اختباره
// HomePage: الصفحة الرئيسية للتطبيق
import 'package:food_delivery/features/home/presentaion/page/home_page.dart';

// استيراد home_state - حالة الصفحة الرئيسية
// show categoryProductsProvider: استيراد محدد - نستورد فقط هذا Provider
// show: استيراد محدد - لتجنب استيراد كل شيء من الملف
// categoryProductsProvider: Provider للمنتجات حسب الفئة
import 'package:food_delivery/features/home/presentaion/state/home_state.dart'
    show categoryProductsProvider;

// استيراد DataSource enum - يحدد مصدر البيانات
import 'package:food_delivery/features/product/domain/entities/data_source.dart';

// استيراد Product entity - كيان المنتج
import 'package:food_delivery/features/product/domain/entities/product.dart';

// استيراد ProductResult - كيان يحتوي على قائمة المنتجات ومصدرها
import 'package:food_delivery/features/product/domain/entities/product_result.dart';

// استيراد product_state - حالة المنتجات
// show: استيراد محدد - نستورد فقط هذه Providers
// recommendedProductsProvider: Provider للمنتجات الموصى بها
// searchQueryProvider: Provider لاستعلام البحث
// searchProductsProvider: Provider لنتائج البحث
import 'package:food_delivery/features/product/presentation/state/product_state.dart'
    show
        recommendedProductsProvider,
        searchQueryProvider,
        searchProductsProvider;

// ============================================================================
// تعليق يوضح نوع الاختبار والطبقة المستهدفة
// Widget Test: اختبار Widget واحد أو مجموعة Widgets
// Presentation Layer: طبقة العرض - الواجهة
// HomePage: الصفحة الرئيسية
// ============================================================================
/// Widget Tests - Presentation Layer: HomePage

// main(): نقطة البداية
void main() {
  // ==========================================================================
  // TEST 1: اختبار عرض شريط البحث
  // ==========================================================================
  // testWidgets(): دالة لاختبار Widget
  // 'HomePage displays search bar': اسم الاختبار (يجب أن يكون وصفياً)
  // WidgetTester tester: أداة للتفاعل مع Widgets
  // async: الاختبار غير متزامن
  testWidgets('HomePage displays search bar', (WidgetTester tester) async {
    // ========================================================================
    // ARRANGE - إعداد البيانات
    // ========================================================================
    // arrange

    // final: متغير ثابت
    // tProducts: بيانات اختبار - قائمة المنتجات
    // List<Product>: قائمة من المنتجات
    final tProducts = [
      // Product(): إنشاء منتج للاختبار
      Product(
        id: '1', // معرف المنتج
        name: 'Test Product', // اسم المنتج
        price: 10.0, // سعر المنتج
        imagePath: 'test.png', // مسار صورة المنتج
        category: 'recommended', // فئة المنتج
      ),
    ];

    // final: متغير ثابت
    // tProductResult: النتيجة المتوقعة من Provider
    // ProductResult: كيان يحتوي على قائمة المنتجات ومصدرها
    final tProductResult = ProductResult(
      products: tProducts, // قائمة المنتجات
      source: DataSource.remote, // مصدر البيانات (من API)
    );

    // ========================================================================
    // ACT - بناء Widget
    // ========================================================================
    // act

    // await: انتظار اكتمال العملية
    // pumpWidget(): بناء Widget في بيئة الاختبار
    // الهدف: إنشاء Widget tree للاختبار
    await tester.pumpWidget(
      // ProviderScope: wrapper للـ Riverpod providers
      // ضروري: أي widget يستخدم Riverpod يحتاج ProviderScope
      ProviderScope(
        // overrides: قائمة بالـ providers التي نريد تجاوزها
        // الهدف: استبدال الـ providers الحقيقية بقيم اختبارية
        overrides: [
          // recommendedProductsProvider.overrideWithValue(): تجاوز Provider بقيمة ثابتة
          // AsyncValue.data(): قيمة ناجحة (success) من AsyncValue
          // AsyncValue: نوع بيانات غير متزامن في Riverpod (loading, data, error)
          // الهدف: محاكاة Provider يعيد بيانات بنجاح
          recommendedProductsProvider.overrideWithValue(
            AsyncValue.data(tProductResult),
          ),

          // categoryProductsProvider.overrideWithValue(): نفس الشيء لـ Category Products
          categoryProductsProvider.overrideWithValue(
            AsyncValue.data(tProductResult),
          ),

          // تعليق: تجاوز search providers لتجنب الأخطاء
          // Override search providers to avoid errors

          // searchQueryProvider.overrideWithValue(''): تجاوز بقيمة فارغة
          // '': نص فارغ - لا يوجد بحث
          // الهدف: تجنب الأخطاء لأن HomePage يستخدم searchQueryProvider
          searchQueryProvider.overrideWithValue(''),

          // searchProductsProvider.overrideWith(): تجاوز Provider بدالة
          // (ref, query): معاملات الدالة (ref و query)
          // ref: مرجع للـ Provider
          // query: استعلام البحث
          // async: دالة غير متزامنة
          // return ProductResult(...): إرجاع قائمة فارغة
          // الهدف: محاكاة Provider يعيد قائمة فارغة (لا توجد نتائج)
          searchProductsProvider.overrideWith((ref, query) async {
            return ProductResult(products: [], source: DataSource.local);
          }),
        ],

        // child: الـ Widget الذي نريد اختباره
        // MaterialApp: تطبيق Material Design
        // home: HomePage(): الصفحة الرئيسية
        // const: ثابت - لا يتغير
        // الهدف: Widgets تحتاج MaterialApp للعمل بشكل صحيح
        child: const MaterialApp(home: HomePage()),
      ),
    );

    // ========================================================================
    // ASSERT - التحقق من النتائج
    // ========================================================================
    // assert

    // expect(): التحقق من وجود نص في Widget tree
    // find.text(): البحث عن نص في Widget tree
    // 'Search for fruit salad combos': النص المطلوب (نص placeholder في شريط البحث)
    // findsOneWidget: matcher يتحقق من وجود widget واحد فقط
    // findsOneWidget: يجب أن يكون widget واحد بالضبط
    // الهدف: التأكد من عرض شريط البحث بشكل صحيح
    expect(find.text('Search for fruit salad combos'), findsOneWidget);
  });

  // ==========================================================================
  // TEST 2: اختبار عرض المنتجات عند تحميل البيانات
  // ==========================================================================
  // testWidgets(): اختبار آخر
  // 'HomePage displays products when data is loaded': اسم الاختبار
  testWidgets('HomePage displays products when data is loaded', (
    WidgetTester tester,
  ) async {
    // ========================================================================
    // ARRANGE - إعداد البيانات
    // ========================================================================
    // arrange

    // final: متغير ثابت
    // tProducts: بيانات اختبار - قائمة المنتجات
    final tProducts = [
      // Product(): إنشاء منتج للاختبار
      Product(
        id: '1', // معرف المنتج
        name: 'Test Product', // اسم المنتج
        price: 10.0, // سعر المنتج
        imagePath: 'test.png', // مسار صورة المنتج
        category: 'recommended', // فئة المنتج
      ),
    ];

    // final: متغير ثابت
    // tProductResult: النتيجة المتوقعة
    final tProductResult = ProductResult(
      products: tProducts, // قائمة المنتجات
      source: DataSource.remote, // مصدر البيانات
    );

    // ========================================================================
    // ACT - بناء Widget
    // ========================================================================
    // act

    // await: انتظار اكتمال العملية
    // pumpWidget(): بناء Widget
    await tester.pumpWidget(
      // ProviderScope: wrapper للـ providers
      ProviderScope(
        // overrides: تجاوز الـ providers
        overrides: [
          // recommendedProductsProvider: تجاوز بقيمة ناجحة
          recommendedProductsProvider.overrideWithValue(
            AsyncValue.data(tProductResult),
          ),

          // categoryProductsProvider: تجاوز بقيمة ناجحة
          categoryProductsProvider.overrideWithValue(
            AsyncValue.data(tProductResult),
          ),

          // تعليق: تجاوز search providers
          // Override search providers to avoid errors

          // searchQueryProvider: تجاوز بقيمة فارغة
          searchQueryProvider.overrideWithValue(''),

          // searchProductsProvider: تجاوز بدالة تعيد قائمة فارغة
          searchProductsProvider.overrideWith((ref, query) async {
            return ProductResult(products: [], source: DataSource.local);
          }),
        ],

        // child: MaterialApp مع HomePage
        child: const MaterialApp(home: HomePage()),
      ),
    );

    // await: انتظار اكتمال جميع الرسوم المتحركة والعمليات
    // pumpAndSettle(): انتظار اكتمال جميع الـ frames
    // الفرق عن pumpWidget(): ينتظر حتى يستقر التطبيق تماماً
    // الهدف: التأكد من تحميل جميع البيانات وعرضها
    await tester.pumpAndSettle();

    // ========================================================================
    // ASSERT - التحقق من النتائج
    // ========================================================================
    // assert

    // expect(): التحقق من وجود عنوان القسم
    // find.text('Recommended Combo'): البحث عن نص "Recommended Combo"
    // findsOneWidget: يجب أن يكون widget واحد فقط
    // الهدف: التأكد من عرض عنوان القسم
    expect(find.text('Recommended Combo'), findsOneWidget);

    // expect(): التحقق من وجود اسم المنتج
    // find.text('Test Product'): البحث عن نص "Test Product"
    // findsWidgets: يمكن أن يكون واحد أو أكثر (ليس بالضرورة واحد فقط)
    // findsWidgets: يتحقق من وجود widget واحد على الأقل
    // الهدف: التأكد من عرض المنتجات بشكل صحيح
    expect(find.text('Test Product'), findsWidgets);
  });
}

// ============================================================================
// ملاحظات مهمة:
// ============================================================================
// 1. Widget Tests تحتاج MaterialApp و ProviderScope في معظم الحالات
// 2. pumpWidget(): بناء Widget في بيئة الاختبار
// 3. pumpAndSettle(): انتظار اكتمال جميع العمليات
// 4. find.text(): البحث عن نص في Widget tree
// 5. findsOneWidget: widget واحد بالضبط
// 6. findsWidgets: widget واحد أو أكثر
// 7. overrideWithValue(): تجاوز Provider بقيمة ثابتة
// 8. overrideWith(): تجاوز Provider بدالة
// ============================================================================
