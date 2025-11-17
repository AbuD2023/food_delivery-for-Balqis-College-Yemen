# دليل شامل ومفصل للاختبارات (Testing Guide)
## شرح كل سطر في ملفات الاختبار

---

## 📚 جدول المحتويات

1. [مقدمة عن أنواع الاختبارات](#مقدمة-عن-أنواع-الاختبارات)
2. [Unit Test - Domain Layer (UseCase)](#1-unit-test---domain-layer-usecase)
3. [Unit Test - Data Layer (Repository)](#2-unit-test---data-layer-repository)
4. [Widget Test - Presentation Layer](#3-widget-test---presentation-layer)
5. [Integration Test](#4-integration-test)
6. [مفاهيم مهمة في الاختبارات](#مفاهيم-مهمة-في-الاختبارات)

---

## مقدمة عن أنواع الاختبارات

### 1. Unit Test (اختبار الوحدة)
- **الهدف**: اختبار وحدة واحدة من الكود (class, function) بشكل منعزل
- **المستوى**: Domain Layer (UseCases) و Data Layer (Repositories)
- **الأدوات**: `flutter_test`, `mockito`
- **السرعة**: سريع جداً

### 2. Widget Test (اختبار الواجهة)
- **الهدف**: اختبار widget واحد أو مجموعة widgets
- **المستوى**: Presentation Layer (UI)
- **الأدوات**: `flutter_test`, `WidgetTester`
- **السرعة**: سريع

### 3. Integration Test (اختبار التكامل)
- **الهدف**: اختبار التطبيق بالكامل من البداية للنهاية
- **المستوى**: جميع الطبقات معاً
- **الأدوات**: `integration_test`
- **السرعة**: بطيء نسبياً

---

## 1. Unit Test - Domain Layer (UseCase)

### الملف: `test/features/product/domain/usecases/get_products_usecase_test.dart`

```dart
import 'package:flutter_test/flutter_test.dart';
```
**الشرح**: 
- استيراد مكتبة `flutter_test` التي توفر أدوات الاختبار الأساسية
- تحتوي على: `test()`, `expect()`, `setUp()`, `group()`, وغيرها

```dart
import 'package:food_delivery/features/product/domain/entities/data_source.dart';
import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/domain/entities/product_result.dart';
```
**الشرح**:
- استيراد الـ Entities (الكيانات) التي سنستخدمها في الاختبار
- `DataSource`: enum يحدد مصدر البيانات (remote/local)
- `Product`: كيان المنتج
- `ProductResult`: كيان يحتوي على قائمة المنتجات ومصدرها

```dart
import 'package:food_delivery/features/product/domain/repositories/product_repository.dart';
```
**الشرح**:
- استيراد الـ Repository interface (الواجهة)
- سنستخدم Mock (تقليد) لهذا الـ Repository في الاختبار

```dart
import 'package:food_delivery/features/product/domain/usecases/get_products_usecase.dart';
```
**الشرح**:
- استيراد الـ UseCase الذي نريد اختباره
- هذا هو الكود الذي سنختبره

```dart
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
```
**الشرح**:
- `mockito/annotations.dart`: يحتوي على `@GenerateMocks` annotation
- `mockito/mockito.dart`: يحتوي على `when()`, `verify()`, `Mock` class
- Mockito: مكتبة لإنشاء كائنات وهمية (mocks) تحاكي السلوك الحقيقي

```dart
import 'get_products_usecase_test.mocks.dart';
```
**الشرح**:
- استيراد ملف الـ Mocks الذي تم إنشاؤه تلقائياً بواسطة `build_runner`
- هذا الملف يحتوي على `MockProductRepository` class
- **ملاحظة**: يجب تشغيل `dart run build_runner build` لإنشاء هذا الملف

```dart
/// Unit Tests - Domain Layer (UseCases) for GetProductsUsecase
```
**الشرح**:
- تعليق يوضح نوع الاختبار والطبقة المستهدفة
- Unit Test للطبقة Domain (UseCase)

```dart
@GenerateMocks([ProductRepository])
```
**الشرح**:
- Annotation من Mockito يخبر `build_runner` بإنشاء Mock class
- `[ProductRepository]`: قائمة بالـ classes التي نريد إنشاء Mocks لها
- سيتم إنشاء `MockProductRepository` تلقائياً

```dart
void main() {
```
**الشرح**:
- نقطة البداية لأي ملف اختبار في Dart
- جميع الاختبارات يجب أن تكون داخل `main()`

```dart
  late GetProductsUsecase useCase;
  late MockProductRepository mockRepository;
```
**الشرح**:
- `late`: كلمة مفتاحية تعني أن المتغير سيتم تهيئته لاحقاً (قبل استخدامه)
- `useCase`: متغير من نوع `GetProductsUsecase` - الكود الذي نختبره
- `mockRepository`: متغير من نوع `MockProductRepository` - كائن وهمي يحاكي Repository
- **لماذا late؟**: لأننا سنقوم بتهيئتها في `setUp()`

```dart
  setUp(() {
    mockRepository = MockProductRepository();
    useCase = GetProductsUsecase(mockRepository);
  });
```
**الشرح**:
- `setUp()`: دالة يتم تنفيذها قبل كل اختبار
- **الهدف**: تهيئة المتغيرات المشتركة بين جميع الاختبارات
- `MockProductRepository()`: إنشاء كائن وهمي من Repository
- `GetProductsUsecase(mockRepository)`: إنشاء UseCase مع حقن الـ Mock Repository
- **ميزة**: يضمن أن كل اختبار يبدأ بحالة نظيفة

```dart
  final tProducts = [
    Product(
      id: '1',
      name: 'Test Product',
      price: 10.0,
      imagePath: 'test.png',
      category: 'recommended',
    ),
  ];
```
**الشرح**:
- `final`: متغير ثابت لا يمكن تغييره بعد التهيئة
- `tProducts`: بيانات اختبار (test data) - القيمة المتوقعة
- **الاصطلاح**: استخدام `t` كبادئة للبيانات الاختبارية (test data)
- قائمة تحتوي على منتج واحد للاختبار

```dart
  final tProductResult = ProductResult(
    products: tProducts,
    source: DataSource.remote,
  );
```
**الشرح**:
- `tProductResult`: النتيجة المتوقعة من UseCase
- يحتوي على: قائمة المنتجات ومصدر البيانات (remote)

```dart
  test('should get products from the repository', () async {
```
**الشرح**:
- `test()`: دالة لإنشاء اختبار واحد
- `'should get products from the repository'`: اسم الاختبار (يجب أن يكون وصفياً)
- `() async`: الاختبار غير متزامن (async) لأن UseCase يعيد `Future`
- **نمط الاسم**: "should [action] when [condition]"

```dart
    // arrange
```
**الشرح**:
- **AAA Pattern**: Arrange-Act-Assert
- **Arrange**: إعداد البيانات والظروف للاختبار
- تحضير كل ما نحتاجه قبل تنفيذ الكود

```dart
    when(mockRepository.getProducts()).thenAnswer((_) async => tProductResult);
```
**الشرح**:
- `when()`: من Mockito - يحدد السلوك المتوقع للـ Mock
- `mockRepository.getProducts()`: عندما يتم استدعاء هذه الدالة
- `thenAnswer()`: يجب أن تعيد هذه القيمة
- `(_) async => tProductResult`: دالة غير متزامنة تعيد `tProductResult`
- **الهدف**: محاكاة سلوك Repository الحقيقي بدون الاتصال بالشبكة

```dart
    // act
```
**الشرح**:
- **Act**: تنفيذ الكود الذي نريد اختباره
- استدعاء الدالة/الـ UseCase

```dart
    final result = await useCase();
```
**الشرح**:
- `await`: انتظار اكتمال العملية غير المتزامنة
- `useCase()`: استدعاء UseCase (دالة `call()`)
- `result`: النتيجة الفعلية من UseCase

```dart
    // assert
```
**الشرح**:
- **Assert**: التحقق من النتائج
- التأكد من أن النتيجة مطابقة للتوقعات

```dart
    expect(result, equals(tProductResult));
```
**الشرح**:
- `expect()`: دالة للتحقق من القيمة
- `result`: القيمة الفعلية
- `equals(tProductResult)`: matcher يتحقق من المساواة
- **الهدف**: التأكد من أن النتيجة مطابقة للنتيجة المتوقعة

```dart
    verify(mockRepository.getRecommendedProducts());
```
**الشرح**:
- `verify()`: من Mockito - يتحقق من أن الدالة تم استدعاؤها
- **ملاحظة**: هناك خطأ في الكود! يجب أن يكون `getProducts()` وليس `getRecommendedProducts()`
- **الهدف**: التأكد من أن UseCase استدعى Repository بشكل صحيح

```dart
    verifyNoMoreInteractions(mockRepository);
```
**الشرح**:
- `verifyNoMoreInteractions()`: يتحقق من عدم وجود استدعاءات أخرى
- **الهدف**: التأكد من أن UseCase لم يستدعِ دوال أخرى غير المتوقعة
- **ميزة**: يكتشف الأخطاء الخفية

---

## 2. Unit Test - Data Layer (Repository)

### الملف: `test/features/product/data/repositories/product_repository_impl_test.dart`

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery/features/product/data/datasources/product_local_data_source.dart';
import 'package:food_delivery/features/product/data/datasources/product_remote_data_source.dart';
```
**الشرح**:
- استيراد Data Sources (Remote و Local)
- سنستخدم Mocks لهما لاختبار Repository بشكل منعزل

```dart
import 'package:food_delivery/features/product/data/models/product_model.dart';
```
**الشرح**:
- `ProductModel`: نموذج البيانات (Model) الذي يمتد من `Product`
- يحتوي على دوال JSON serialization/deserialization

```dart
import 'package:food_delivery/features/product/data/repositories/product_repository_impl.dart';
```
**الشرح**:
- الـ Repository الذي نريد اختباره
- هذا هو الكود الذي سنختبره

```dart
@GenerateMocks([ProductRemoteDataSource, ProductLocalDataSource])
```
**الشرح**:
- إنشاء Mocks لـ Data Sources
- `MockProductRemoteDataSource` و `MockProductLocalDataSource`
- **السبب**: Repository يعتمد على Data Sources، لذا نحتاج Mocks

```dart
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSource mockRemoteDataSource;
  late MockProductLocalDataSource mockLocalDataSource;
```
**الشرح**:
- `repository`: الـ Repository الذي نختبره
- `mockRemoteDataSource`: Mock للـ Remote Data Source
- `mockLocalDataSource`: Mock للـ Local Data Source
- **الهدف**: اختبار Repository بدون الاتصال بالشبكة أو قاعدة البيانات

```dart
  setUp(() {
    mockRemoteDataSource = MockProductRemoteDataSource();
    mockLocalDataSource = MockProductLocalDataSource();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });
```
**الشرح**:
- إنشاء Mocks جديدة قبل كل اختبار
- حقن Mocks في Repository (Dependency Injection)
- **ميزة**: كل اختبار يبدأ بحالة نظيفة

```dart
  final tProductModel = ProductModel(
    id: '1',
    name: 'Test Product',
    price: 10.0,
    imagePath: 'test.png',
    category: 'recommended',
  );
```
**الشرح**:
- بيانات اختبار (test data)
- `ProductModel`: نموذج البيانات المستخدم في Data Layer

```dart
  group('getProducts', () {
```
**الشرح**:
- `group()`: تجميع الاختبارات المتعلقة بنفس الوظيفة
- `'getProducts'`: اسم المجموعة
- **الفائدة**: تنظيم الاختبارات وتجميعها بشكل منطقي

```dart
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
```
**الشرح**:
- اختبار الحالة الناجحة (success case)
- **السيناريو**: عندما يكون Remote Data Source ناجحاً
- **التوقع**: يجب أن تعيد Repository البيانات من Remote

```dart
        // arrange
        when(
          mockRemoteDataSource.getProducts(),
        ).thenAnswer((_) async => [tProductModel]);
```
**الشرح**:
- إعداد Mock للـ Remote Data Source
- عندما يتم استدعاء `getProducts()`، يجب أن تعيد قائمة المنتجات
- **محاكاة**: نجاح الاتصال بالـ API

```dart
        // act
        final result = await repository.getProducts();
```
**الشرح**:
- تنفيذ الكود: استدعاء `getProducts()` من Repository

```dart
        // assert
        verify(mockRemoteDataSource.getProducts());
        expect(result.products, [tProductModel]);
        expect(result.source, DataSource.remote);
```
**الشرح**:
- `verify()`: التأكد من استدعاء Remote Data Source
- `expect(result.products, [tProductModel])`: التحقق من المنتجات
- `expect(result.source, DataSource.remote)`: التحقق من المصدر
- **الهدف**: التأكد من أن Repository يستخدم Remote عند النجاح

```dart
    test(
      'should return local data when the call to remote data source fails',
      () async {
```
**الشرح**:
- اختبار الحالة الفاشلة (failure case)
- **السيناريو**: عندما يفشل Remote Data Source
- **التوقع**: يجب أن تعيد Repository البيانات من Local (fallback)

```dart
        // arrange
        when(
          mockRemoteDataSource.getProducts(),
        ).thenThrow(Exception('Network error'));
        when(mockLocalDataSource.getProducts()).thenReturn([tProductModel]);
```
**الشرح**:
- `thenThrow()`: Mock يرمي استثناء (exception) عند الاستدعاء
- **محاكاة**: فشل الاتصال بالـ API
- `thenReturn()`: Mock يعيد البيانات من Local
- **الهدف**: محاكاة آلية Fallback

```dart
        // assert
        verify(mockRemoteDataSource.getProducts());
        verify(mockLocalDataSource.getProducts());
        expect(result.products, [tProductModel]);
        expect(result.source, DataSource.local);
```
**الشرح**:
- `verify()`: التأكد من استدعاء Remote أولاً (محاولة)
- `verify()`: التأكد من استدعاء Local بعد الفشل (fallback)
- `expect(result.source, DataSource.local)`: التحقق من المصدر
- **الهدف**: التأكد من آلية Fallback تعمل بشكل صحيح

```dart
  group('searchProducts', () {
```
**الشرح**:
- مجموعة اختبارات لوظيفة البحث
- نفس النمط: اختبار الحالات الناجحة والفاشلة

---

## 3. Widget Test - Presentation Layer

### الملف: `test/features/home/presentation/page/home_page_test.dart`

```dart
import 'package:flutter/material.dart';
```
**الشرح**:
- استيراد Flutter Material widgets
- نحتاجها لبناء الـ Widgets في الاختبار

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
```
**الشرح**:
- استيراد Riverpod للـ State Management
- `ProviderScope`: widget wrapper للـ providers
- `overrideWithValue()`: لتجاوز (override) الـ providers في الاختبار

```dart
import 'package:flutter_test/flutter_test.dart';
```
**الشرح**:
- مكتبة الاختبار الأساسية
- `testWidgets()`: لاختبار Widgets
- `WidgetTester`: أداة للتفاعل مع Widgets
- `find`: للبحث عن Widgets في الشجرة
- `expect()`: للتحقق من النتائج

```dart
import 'package:food_delivery/features/home/presentaion/page/home_page.dart';
```
**الشرح**:
- الـ Widget الذي نريد اختباره
- `HomePage`: الصفحة الرئيسية

```dart
import 'package:food_delivery/features/home/presentaion/state/home_state.dart'
    show categoryProductsProvider;
```
**الشرح**:
- `show`: استيراد محدد - نستورد فقط `categoryProductsProvider`
- **السبب**: لتجنب استيراد كل شيء من الملف

```dart
import 'package:food_delivery/features/product/domain/entities/data_source.dart';
import 'package:food_delivery/features/product/domain/entities/product.dart';
import 'package:food_delivery/features/product/domain/entities/product_result.dart';
```
**الشرح**:
- استيراد الـ Entities للبيانات الاختبارية

```dart
import 'package:food_delivery/features/product/presentation/state/product_state.dart'
    show
        recommendedProductsProvider,
        searchQueryProvider,
        searchProductsProvider;
```
**الشرح**:
- استيراد الـ Providers التي يحتاجها `HomePage`
- سنقوم بتجاوزها (override) في الاختبار

```dart
/// Widget Tests - Presentation Layer: HomePage
```
**الشرح**:
- تعليق يوضح نوع الاختبار والطبقة

```dart
void main() {
```
**الشرح**:
- نقطة البداية

```dart
  testWidgets('HomePage displays search bar', (WidgetTester tester) async {
```
**الشرح**:
- `testWidgets()`: دالة لاختبار Widget
- `'HomePage displays search bar'`: اسم الاختبار
- `WidgetTester tester`: أداة للتفاعل مع Widgets
- `async`: الاختبار غير متزامن

```dart
    // arrange
    final tProducts = [
      Product(
        id: '1',
        name: 'Test Product',
        price: 10.0,
        imagePath: 'test.png',
        category: 'recommended',
      ),
    ];
```
**الشرح**:
- إعداد بيانات الاختبار
- منتج واحد للاختبار

```dart
    final tProductResult = ProductResult(
      products: tProducts,
      source: DataSource.remote,
    );
```
**الشرح**:
- النتيجة المتوقعة من Provider
- `DataSource.remote`: البيانات من API

```dart
    // act
    await tester.pumpWidget(
```
**الشرح**:
- `pumpWidget()`: بناء Widget في بيئة الاختبار
- `await`: انتظار اكتمال البناء
- **الهدف**: إنشاء Widget tree للاختبار

```dart
      ProviderScope(
```
**الشرح**:
- `ProviderScope`: wrapper للـ Riverpod providers
- **ضروري**: أي widget يستخدم Riverpod يحتاج `ProviderScope`

```dart
        overrides: [
```
**الشرح**:
- `overrides`: قائمة بالـ providers التي نريد تجاوزها
- **الهدف**: استبدال الـ providers الحقيقية بقيم اختبارية

```dart
          recommendedProductsProvider.overrideWithValue(
            AsyncValue.data(tProductResult),
          ),
```
**الشرح**:
- `overrideWithValue()`: تجاوز Provider بقيمة ثابتة
- `AsyncValue.data()`: قيمة ناجحة (success) من AsyncValue
- **الهدف**: محاكاة Provider يعيد بيانات بنجاح

```dart
          categoryProductsProvider.overrideWithValue(
            AsyncValue.data(tProductResult),
          ),
```
**الشرح**:
- نفس الشيء لـ `categoryProductsProvider`

```dart
          // Override search providers to avoid errors
          searchQueryProvider.overrideWithValue(''),
```
**الشرح**:
- `overrideWithValue('')`: تجاوز بقيمة فارغة
- **السبب**: `HomePage` يستخدم `searchQueryProvider`، يجب تجاوزه

```dart
          searchProductsProvider.overrideWith((ref, query) async {
            return ProductResult(products: [], source: DataSource.local);
          }),
```
**الشرح**:
- `overrideWith()`: تجاوز Provider بدالة
- `(ref, query)`: معاملات الدالة (ref و query)
- `async`: دالة غير متزامنة
- **الهدف**: محاكاة Provider يعيد قائمة فارغة

```dart
        ],
        child: const MaterialApp(home: HomePage()),
```
**الشرح**:
- `MaterialApp`: تطبيق Material Design
- `home: HomePage()`: الصفحة الرئيسية
- **السبب**: Widgets تحتاج `MaterialApp` للعمل بشكل صحيح

```dart
    );

    // assert
    expect(find.text('Search for fruit salad combos'), findsOneWidget);
```
**الشرح**:
- `find.text()`: البحث عن نص في Widget tree
- `'Search for fruit salad combos'`: النص المطلوب
- `findsOneWidget`: matcher يتحقق من وجود widget واحد فقط
- **الهدف**: التأكد من عرض شريط البحث

```dart
  testWidgets('HomePage displays products when data is loaded', (
    WidgetTester tester,
  ) async {
```
**الشرح**:
- اختبار آخر: عرض المنتجات عند تحميل البيانات
- نفس البنية

```dart
    await tester.pumpAndSettle();
```
**الشرح**:
- `pumpAndSettle()`: انتظار اكتمال جميع الرسوم المتحركة والعمليات
- **الفرق عن `pumpWidget()`**: ينتظر حتى يستقر التطبيق تماماً
- **متى نستخدمه**: بعد التفاعلات (tap, scroll, etc.)

```dart
    // assert
    expect(find.text('Recommended Combo'), findsOneWidget);
    expect(find.text('Test Product'), findsWidgets);
```
**الشرح**:
- `find.text('Recommended Combo')`: البحث عن عنوان القسم
- `findsOneWidget`: يجب أن يكون واحد فقط
- `find.text('Test Product')`: البحث عن اسم المنتج
- `findsWidgets`: يمكن أن يكون واحد أو أكثر
- **الهدف**: التأكد من عرض المنتجات بشكل صحيح

---

## 4. Integration Test

### الملف: `integration_test/app_test.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery/main.dart' as app;
```
**الشرح**:
- `main.dart as app`: استيراد `main()` كـ `app.main()`
- **السبب**: لتجنب تعارض الأسماء مع `main()` في الاختبار

```dart
import 'package:integration_test/integration_test.dart';
```
**الشرح**:
- مكتبة Integration Test
- **الفرق**: يختبر التطبيق بالكامل على جهاز حقيقي أو محاكي

```dart
/// Integration Test: App Test
void main() {
```
**الشرح**:
- نقطة البداية

```dart
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
```
**الشرح**:
- `ensureInitialized()`: تهيئة Integration Test binding
- **ضروري**: يجب استدعاؤه قبل أي اختبار
- **الهدف**: إعداد بيئة الاختبار للتطبيق الكامل

```dart
  group('end-to-end test', () {
```
**الشرح**:
- `group()`: تجميع الاختبارات
- `'end-to-end test'`: اختبار من البداية للنهاية

```dart
    testWidgets('complete user flow: search and add to cart', (
      WidgetTester tester,
    ) async {
```
**الشرح**:
- اختبار سيناريو كامل للمستخدم
- **الهدف**: محاكاة استخدام حقيقي للتطبيق

```dart
      // Start the app
      app.main();
```
**الشرح**:
- `app.main()`: بدء التطبيق بالكامل
- **الفرق عن Widget Test**: نبدأ التطبيق الكامل وليس widget واحد

```dart
      await tester.pumpAndSettle();
```
**الشرح**:
- انتظار اكتمال بدء التطبيق
- **الهدف**: التأكد من تحميل جميع الشاشات

```dart
      // Find and tap the search bar
      final searchBar = find.byType(TextField);
```
**الشرح**:
- `find.byType(TextField)`: البحث عن widget حسب النوع
- `TextField`: نوع الـ widget
- **الهدف**: العثور على شريط البحث

```dart
      expect(searchBar, findsOneWidget);
```
**الشرح**:
- التحقق من وجود شريط بحث واحد فقط
- **الهدف**: التأكد من أن التطبيق تم تحميله بشكل صحيح

```dart
      await tester.tap(searchBar);
```
**الشرح**:
- `tap()`: محاكاة النقر على widget
- **الهدف**: تفعيل شريط البحث

```dart
      await tester.pumpAndSettle();
```
**الشرح**:
- انتظار اكتمال التفاعل

```dart
      // Enter search query
      await tester.enterText(searchBar, 'fruit');
```
**الشرح**:
- `enterText()`: إدخال نص في TextField
- `'fruit'`: النص المدخل
- **الهدف**: محاكاة كتابة المستخدم

```dart
      await tester.pumpAndSettle();
```
**الشرح**:
- انتظار اكتمال البحث

```dart
      // Verify search results are displayed
      expect(find.text('نتائج البحث'), findsOneWidget);
```
**الشرح**:
- التحقق من عرض نتائج البحث
- `'نتائج البحث'`: النص العربي المتوقع

```dart
      // Tap on a product to add to cart
      final addToCartButton = find.byIcon(Icons.add_shopping_cart);
```
**الشرح**:
- `find.byIcon()`: البحث عن widget حسب الأيقونة
- `Icons.add_shopping_cart`: أيقونة إضافة للسلة

```dart
      if (addToCartButton.evaluate().isNotEmpty) {
```
**الشرح**:
- `evaluate()`: تقييم البحث
- `isNotEmpty`: التحقق من وجود نتائج
- **السبب**: قد لا يكون هناك منتجات في بعض الحالات

```dart
        await tester.tap(addToCartButton.first);
```
**الشرح**:
- `first`: أول نتيجة من البحث
- النقر على زر الإضافة

```dart
        await tester.pumpAndSettle();
```
**الشرح**:
- انتظار اكتمال العملية

```dart
        // Verify snackbar appears
        expect(find.text('added to cart'), findsOneWidget);
```
**الشرح**:
- التحقق من ظهور رسالة النجاح
- **الهدف**: التأكد من أن العملية تمت بنجاح

---

## مفاهيم مهمة في الاختبارات

### 1. AAA Pattern (Arrange-Act-Assert)
```
Arrange: إعداد البيانات والظروف
Act: تنفيذ الكود
Assert: التحقق من النتائج
```

### 2. Mock vs Stub vs Fake
- **Mock**: كائن وهمي يحاكي السلوك ويسجل الاستدعاءات
- **Stub**: كائن وهمي يعيد قيماً محددة مسبقاً
- **Fake**: تنفيذ مبسط للواجهة (مثل قاعدة بيانات في الذاكرة)

### 3. Test Coverage (تغطية الاختبارات)
- **الهدف**: اختبار أكبر قدر ممكن من الكود
- **المستوى المثالي**: 80%+ coverage

### 4. Test Isolation (عزل الاختبارات)
- كل اختبار يجب أن يكون مستقلاً
- لا يعتمد على نتائج اختبارات أخرى
- `setUp()` و `tearDown()` لضمان العزل

### 5. Matchers (مطابقات)
- `equals()`: المساواة
- `findsOneWidget`: widget واحد
- `findsWidgets`: واحد أو أكثر
- `findsNothing`: لا يوجد
- `isA<Type>()`: من نوع معين

### 6. Async Testing (الاختبارات غير المتزامنة)
- استخدام `await` مع `Future`
- `pumpAndSettle()` للانتظار الكامل
- `pump()` للانتظار frame واحد

---

## نصائح مهمة

1. **أسماء الاختبارات**: يجب أن تكون وصفية وواضحة
2. **اختبار واحد = فكرة واحدة**: كل اختبار يختبر شيء واحد فقط
3. **استخدام `setUp()` و `tearDown()`**: لإعداد وتنظيف البيانات
4. **تجنب الاختبارات المعتمدة على بعضها**: كل اختبار مستقل
5. **اختبار الحالات الحدية**: (edge cases) مثل القيم الفارغة، الأخطاء، إلخ
6. **استخدام Mocks بحكمة**: فقط للتبعيات الخارجية

---

## الخلاصة

- **Unit Test**: سريع، يختبر وحدة واحدة
- **Widget Test**: يختبر UI و widgets
- **Integration Test**: يختبر التطبيق بالكامل
- **AAA Pattern**: Arrange, Act, Assert
- **Mocks**: لمحاكاة التبعيات الخارجية
- **Test Isolation**: كل اختبار مستقل

---

## المراجع

- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [Mockito Documentation](https://pub.dev/packages/mockito)
- [Riverpod Testing](https://riverpod.dev/docs/concepts/testing)

