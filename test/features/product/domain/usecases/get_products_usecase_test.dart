// ============================================================================
// UNIT TEST - DOMAIN LAYER (USECASE)
// ============================================================================
// هذا الملف يختبر UseCase في طبقة Domain
// UseCase: منطق العمل (Business Logic) - ما يفعله التطبيق
// ============================================================================

// استيراد مكتبة flutter_test - تحتوي على أدوات الاختبار الأساسية
// تحتوي على: test(), expect(), setUp(), group(), وغيرها
import 'package:flutter_test/flutter_test.dart';

// استيراد DataSource enum - يحدد مصدر البيانات (remote أو local)
// remote: من API/الشبكة
// local: من قاعدة البيانات المحلية
import 'package:food_delivery/features/product/domain/entities/data_source.dart';

// استيراد Product entity - كيان المنتج (البيانات الأساسية)
// Entity: كيان في Domain Layer - يمثل البيانات الأساسية
import 'package:food_delivery/features/product/domain/entities/product.dart';

// استيراد ProductResult - كيان يحتوي على قائمة المنتجات ومصدرها
// ProductResult: wrapper class يحتوي على products و source
import 'package:food_delivery/features/product/domain/entities/product_result.dart';

// استيراد ProductRepository interface - واجهة Repository
// Repository: طبقة مسؤولة عن جلب البيانات من مصادر مختلفة
// Interface: عقد يحدد ما يجب أن تفعله Repository بدون تحديد كيف
import 'package:food_delivery/features/product/domain/repositories/product_repository.dart';

// استيراد GetProductsUsecase - الكود الذي نريد اختباره
// UseCase: منطق العمل - ما يفعله التطبيق (Business Logic)
import 'package:food_delivery/features/product/domain/usecases/get_products_usecase.dart';

// استيراد mockito/annotations - يحتوي على @GenerateMocks annotation
// Annotation: تعليق خاص يخبر build_runner بإنشاء كود تلقائياً
// @GenerateMocks: يخبر build_runner بإنشاء Mock classes
import 'package:mockito/annotations.dart';

// استيراد mockito/mockito - يحتوي على when(), verify(), Mock class
// Mockito: مكتبة لإنشاء كائنات وهمية (Mocks) تحاكي السلوك الحقيقي
// when(): يحدد السلوك المتوقع للـ Mock
// verify(): يتحقق من أن الدالة تم استدعاؤها
import 'package:mockito/mockito.dart';

// استيراد ملف Mocks الذي تم إنشاؤه تلقائياً بواسطة build_runner
// .mocks.dart: ملف يحتوي على Mock classes
// MockProductRepository: كائن وهمي يحاكي ProductRepository
// ملاحظة: يجب تشغيل "dart run build_runner build" لإنشاء هذا الملف
import 'get_products_usecase_test.mocks.dart';

// ============================================================================
// تعليق يوضح نوع الاختبار والطبقة المستهدفة
// Unit Test: اختبار وحدة واحدة من الكود بشكل منعزل
// Domain Layer: طبقة منطق العمل (Business Logic)
// UseCase: منطق العمل - ما يفعله التطبيق
// ============================================================================
/// Unit Tests - Domain Layer (UseCases) for GetProductsUsecase

// @GenerateMocks: Annotation من Mockito
// [ProductRepository]: قائمة بالـ classes التي نريد إنشاء Mocks لها
// سيتم إنشاء MockProductRepository تلقائياً بواسطة build_runner
@GenerateMocks([ProductRepository])
// main(): نقطة البداية لأي ملف اختبار في Dart
// جميع الاختبارات يجب أن تكون داخل main()
void main() {
  // late: كلمة مفتاحية تعني أن المتغير سيتم تهيئته لاحقاً (قبل استخدامه)
  // GetProductsUsecase: نوع المتغير - الكود الذي نريد اختباره
  // useCase: اسم المتغير - UseCase الذي سنختبره
  late GetProductsUsecase useCase;

  // late: سيتم تهيئته في setUp()
  // MockProductRepository: نوع المتغير - كائن وهمي يحاكي ProductRepository
  // mockRepository: اسم المتغير - Mock للـ Repository
  // Mock: كائن وهمي يحاكي السلوك الحقيقي بدون الاتصال بالشبكة أو قاعدة البيانات
  late MockProductRepository mockRepository;

  // setUp(): دالة يتم تنفيذها قبل كل اختبار
  // الهدف: تهيئة المتغيرات المشتركة بين جميع الاختبارات
  // يتم تنفيذها تلقائياً قبل كل test() أو testWidgets()
  setUp(() {
    // MockProductRepository(): إنشاء كائن وهمي جديد من Repository
    // Mock: كائن يحاكي السلوك الحقيقي بدون تنفيذ فعلي
    mockRepository = MockProductRepository();

    // GetProductsUsecase(mockRepository): إنشاء UseCase مع حقن الـ Mock Repository
    // Dependency Injection: حقن التبعيات - نعطي UseCase الـ Mock بدلاً من Repository الحقيقي
    // الهدف: اختبار UseCase بشكل منعزل عن Repository الحقيقي
    useCase = GetProductsUsecase(mockRepository);
  });

  // final: متغير ثابت لا يمكن تغييره بعد التهيئة
  // tProducts: بيانات اختبار (test data) - القيمة المتوقعة
  // t: بادئة للبيانات الاختبارية (test data convention)
  // List<Product>: قائمة من المنتجات
  final tProducts = [
    // Product(): إنشاء منتج للاختبار
    ProductEntity(
      id: '1', // معرف المنتج
      name: 'Test Product', // اسم المنتج
      price: 10.0, // سعر المنتج
      imagePath: 'test.png', // مسار صورة المنتج
      category: 'recommended', // فئة المنتج
    ),
  ];

  // final: متغير ثابت
  // tProductResult: النتيجة المتوقعة من UseCase
  // ProductResult: كيان يحتوي على قائمة المنتجات ومصدرها
  final tProductResult = ProductResult(
    products: tProducts, // قائمة المنتجات
    source: DataSource.remote, // مصدر البيانات (من API)
  );

  // test(): دالة لإنشاء اختبار واحد
  // 'should get products from the repository': اسم الاختبار (يجب أن يكون وصفياً)
  // () async: الاختبار غير متزامن (async) لأن UseCase يعيد Future
  // async: كلمة مفتاحية للدوال غير المتزامنة
  // Future: نوع البيانات غير المتزامنة - يعيد قيمة في المستقبل
  test('should get products from the repository', () async {
    // ========================================================================
    // ARRANGE (إعداد) - AAA Pattern
    // ========================================================================
    // Arrange: إعداد البيانات والظروف للاختبار
    // تحضير كل ما نحتاجه قبل تنفيذ الكود
    // arrange

    // when(): من Mockito - يحدد السلوك المتوقع للـ Mock
    // mockRepository.getProducts(): عندما يتم استدعاء هذه الدالة
    // thenAnswer(): يجب أن تعيد هذه القيمة
    // (_) async => tProductResult: دالة غير متزامنة تعيد tProductResult
    // _: معامل غير مستخدم (ignored parameter)
    // async =>: دالة غير متزامنة
    // الهدف: محاكاة سلوك Repository الحقيقي بدون الاتصال بالشبكة
    when(mockRepository.getProducts()).thenAnswer((_) async => tProductResult);

    // ========================================================================
    // ACT (تنفيذ) - AAA Pattern
    // ========================================================================
    // Act: تنفيذ الكود الذي نريد اختباره
    // استدعاء الدالة/الـ UseCase
    // act

    // await: انتظار اكتمال العملية غير المتزامنة
    // useCase(): استدعاء UseCase (دالة call() تلقائياً)
    // final result: النتيجة الفعلية من UseCase
    // final: متغير ثابت - لا يمكن تغييره بعد التهيئة
    final result = await useCase();

    // ========================================================================
    // ASSERT (التحقق) - AAA Pattern
    // ========================================================================
    // Assert: التحقق من النتائج
    // التأكد من أن النتيجة مطابقة للتوقعات
    // assert

    // expect(): دالة للتحقق من القيمة
    // result: القيمة الفعلية من UseCase
    // equals(tProductResult): matcher يتحقق من المساواة
    // equals(): يتحقق من أن القيمتين متساويتين
    // Matcher: أداة للتحقق من القيم (مثل equals, isA, contains)
    expect(result, equals(tProductResult));

    // verify(): من Mockito - يتحقق من أن الدالة تم استدعاؤها
    // mockRepository.getProducts(): الدالة التي يجب أن تكون قد تم استدعاؤها
    // الهدف: التأكد من أن UseCase استدعى Repository بشكل صحيح
    verify(mockRepository.getProducts());

    // verifyNoMoreInteractions(): يتحقق من عدم وجود استدعاءات أخرى
    // mockRepository: الـ Mock الذي نريد التحقق منه
    // الهدف: التأكد من أن UseCase لم يستدعِ دوال أخرى غير المتوقعة
    // ميزة: يكتشف الأخطاء الخفية - إذا استدعى UseCase دوال أخرى غير متوقعة
    verifyNoMoreInteractions(mockRepository);
  });
}

// ============================================================================
// ملاحظات مهمة:
// ============================================================================
// 1. يجب تشغيل "dart run build_runner build" لإنشاء ملف .mocks.dart
// 2. كل اختبار مستقل - لا يعتمد على اختبارات أخرى
// 3. setUp() يتم تنفيذه قبل كل اختبار - يضمن حالة نظيفة
// 4. AAA Pattern: Arrange, Act, Assert - نمط شائع في الاختبارات
// 5. Mocks: لمحاكاة التبعيات الخارجية (Repository, API, Database)
// ============================================================================
