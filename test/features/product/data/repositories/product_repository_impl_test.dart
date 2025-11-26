// ============================================================================
// UNIT TEST - DATA LAYER (REPOSITORY)
// ============================================================================
// هذا الملف يختبر Repository في طبقة Data
// Repository: طبقة مسؤولة عن جلب البيانات من مصادر مختلفة (API, Database)
// ============================================================================

// استيراد مكتبة flutter_test - أدوات الاختبار الأساسية
import 'package:flutter_test/flutter_test.dart';

// استيراد ProductLocalDataSource - مصدر البيانات المحلية
// LocalDataSource: مصدر البيانات المحلية (قاعدة بيانات محلية، SharedPreferences)
// DataSource: مصدر البيانات - من أين تأتي البيانات
import 'package:food_delivery/features/product/data/datasources/local/product_local_data_source.dart';

// استيراد ProductRemoteDataSource - مصدر البيانات البعيدة
// RemoteDataSource: مصدر البيانات البعيدة (API, Network)
// Remote: بعيد - من الشبكة/API
import 'package:food_delivery/features/product/data/datasources/remote/product_remote_data_source.dart';

// استيراد ProductModel - نموذج البيانات
// Model: نموذج البيانات في Data Layer - يحتوي على JSON serialization
// Model: يمتد من Entity ويضيف دوال JSON
import 'package:food_delivery/features/product/data/models/product_model.dart';

// استيراد ProductRepositoryImpl - الكود الذي نريد اختباره
// RepositoryImpl: تنفيذ Repository - الكود الفعلي
// Impl: اختصار Implementation (التنفيذ)
import 'package:food_delivery/features/product/data/repositories/product_repository_impl.dart';

// استيراد DataSource enum - يحدد مصدر البيانات
import 'package:food_delivery/features/product/domain/entities/data_source.dart';

// استيراد mockito/annotations - لإنشاء Mocks
import 'package:mockito/annotations.dart';

// استيراد mockito/mockito - أدوات Mockito
import 'package:mockito/mockito.dart';

// استيراد ملف Mocks - MockProductRemoteDataSource و MockProductLocalDataSource
import 'product_repository_impl_test.mocks.dart';

// ============================================================================
// تعليق يوضح نوع الاختبار والطبقة المستهدفة
// Unit Test: اختبار وحدة واحدة
// Data Layer: طبقة البيانات
// Repository: طبقة مسؤولة عن جلب البيانات
// ============================================================================
/// Unit Tests - Data Layer (Repository) for ProductRepositoryImpl

// @GenerateMocks: إنشاء Mocks للـ Data Sources
// [ProductRemoteDataSource, ProductLocalDataSource]: قائمة الـ classes
// سيتم إنشاء MockProductRemoteDataSource و MockProductLocalDataSource
@GenerateMocks([ProductRemoteDataSource, ProductLocalDataSource])
// main(): نقطة البداية
void main() {
  // late: سيتم تهيئته في setUp()
  // ProductRepositoryImpl: نوع المتغير - الكود الذي نختبره
  // repository: اسم المتغير
  late ProductRepositoryImpl repository;

  // late: سيتم تهيئته في setUp()
  // MockProductRemoteDataSource: Mock للـ Remote Data Source
  // mockRemoteDataSource: اسم المتغير
  late MockProductRemoteDataSource mockRemoteDataSource;

  // late: سيتم تهيئته في setUp()
  // MockProductLocalDataSource: Mock للـ Local Data Source
  // mockLocalDataSource: اسم المتغير
  late MockProductLocalDataSource mockLocalDataSource;

  // setUp(): تهيئة قبل كل اختبار
  setUp(() {
    // MockProductRemoteDataSource(): إنشاء Mock جديد للـ Remote Data Source
    mockRemoteDataSource = MockProductRemoteDataSource();

    // MockProductLocalDataSource(): إنشاء Mock جديد للـ Local Data Source
    mockLocalDataSource = MockProductLocalDataSource();

    // ProductRepositoryImpl(): إنشاء Repository مع حقن Mocks
    // remoteDataSource: حقن Mock للـ Remote
    // localDataSource: حقن Mock للـ Local
    // Dependency Injection: حقن التبعيات - نعطي Repository الـ Mocks
    // الهدف: اختبار Repository بشكل منعزل عن Data Sources الحقيقية
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource, // Mock للـ Remote
      localDataSource: mockLocalDataSource, // Mock للـ Local
    );
  });

  // final: متغير ثابت
  // tProductModel: بيانات اختبار (test data)
  // ProductModel: نموذج البيانات المستخدم في Data Layer
  final tProductModel = ProductModel(
    id: '1', // معرف المنتج
    name: 'Test Product', // اسم المنتج
    price: 10.0, // سعر المنتج
    imagePath: 'test.png', // مسار الصورة
    category: 'recommended', // فئة المنتج
  );

  // ==========================================================================
  // GROUP: تجميع الاختبارات المتعلقة بنفس الوظيفة
  // ==========================================================================
  // group(): تجميع الاختبارات المتعلقة بنفس الوظيفة
  // 'getProducts': اسم المجموعة - الوظيفة التي نختبرها
  // الفائدة: تنظيم الاختبارات وتجميعها بشكل منطقي
  group('getProducts', () {
    // test(): اختبار واحد
    // 'should return remote data when...': اسم الاختبار - الحالة الناجحة
    // () async: الاختبار غير متزامن
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // ====================================================================
        // ARRANGE - إعداد البيانات
        // ====================================================================
        // arrange

        // when(): تحديد السلوك المتوقع للـ Mock
        // mockRemoteDataSource.getProducts(): عندما يتم استدعاء هذه الدالة
        // thenAnswer(): يجب أن تعيد هذه القيمة
        // (_) async => [tProductModel]: دالة غير متزامنة تعيد قائمة المنتجات
        // [tProductModel]: قائمة تحتوي على منتج واحد
        // الهدف: محاكاة نجاح الاتصال بالـ API
        when(
          mockRemoteDataSource.getProducts(),
        ).thenAnswer((_) async => [tProductModel]);

        // ====================================================================
        // ACT - تنفيذ الكود
        // ====================================================================
        // act

        // await: انتظار اكتمال العملية
        // repository.getProducts(): استدعاء Repository
        // final result: النتيجة الفعلية
        final result = await repository.getProducts();

        // ====================================================================
        // ASSERT - التحقق من النتائج
        // ====================================================================
        // assert

        // verify(): التأكد من استدعاء Remote Data Source
        // الهدف: التأكد من أن Repository حاول الاتصال بالـ API أولاً
        verify(mockRemoteDataSource.getProducts());

        // expect(): التحقق من المنتجات
        // result.products: قائمة المنتجات الفعلية
        // [tProductModel]: القيمة المتوقعة
        expect(result.products, [tProductModel]);

        // expect(): التحقق من مصدر البيانات
        // result.source: مصدر البيانات الفعلي
        // DataSource.remote: القيمة المتوقعة (من API)
        // الهدف: التأكد من أن Repository يستخدم Remote عند النجاح
        expect(result.source, DataSource.remote);
      },
    );

    // test(): اختبار الحالة الفاشلة
    // 'should return local data when...': اسم الاختبار - الحالة الفاشلة
    test(
      'should return local data when the call to remote data source fails',
      () async {
        // ====================================================================
        // ARRANGE - إعداد البيانات (حالة الفشل)
        // ====================================================================
        // arrange

        // when(): تحديد السلوك المتوقع (الفشل)
        // mockRemoteDataSource.getProducts(): عندما يتم استدعاء هذه الدالة
        // thenThrow(): يجب أن ترمي استثناء (exception)
        // Exception('Network error'): نوع الاستثناء والرسالة
        // الهدف: محاكاة فشل الاتصال بالـ API
        when(
          mockRemoteDataSource.getProducts(),
        ).thenThrow(Exception('Network error'));

        // when(): تحديد السلوك المتوقع للـ Local Data Source
        // mockLocalDataSource.getProducts(): عندما يتم استدعاء هذه الدالة
        // thenReturn(): يجب أن تعيد هذه القيمة (مباشرة - غير متزامن)
        // [tProductModel]: قائمة المنتجات من Local
        // الهدف: محاكاة نجاح جلب البيانات من Local
        when(
          mockLocalDataSource.getProducts(),
        ).thenReturn(Future.value([tProductModel]));

        // ====================================================================
        // ACT - تنفيذ الكود
        // ====================================================================
        // act

        // await: انتظار اكتمال العملية
        // repository.getProducts(): استدعاء Repository
        // final result: النتيجة الفعلية (يجب أن تكون من Local)
        final result = await repository.getProducts();

        // ====================================================================
        // ASSERT - التحقق من النتائج
        // ====================================================================
        // assert

        // verify(): التأكد من استدعاء Remote أولاً (محاولة)
        // الهدف: التأكد من أن Repository حاول الاتصال بالـ API أولاً
        verify(mockRemoteDataSource.getProducts());

        // verify(): التأكد من استدعاء Local بعد الفشل (fallback)
        // الهدف: التأكد من أن Repository استخدم Local كبديل
        verify(mockLocalDataSource.getProducts());

        // expect(): التحقق من المنتجات
        // result.products: قائمة المنتجات الفعلية
        // [tProductModel]: القيمة المتوقعة (من Local)
        expect(result.products, [tProductModel]);

        // expect(): التحقق من مصدر البيانات
        // result.source: مصدر البيانات الفعلي
        // DataSource.local: القيمة المتوقعة (من Local)
        // الهدف: التأكد من أن Repository يستخدم Local عند الفشل (Fallback)
        expect(result.source, DataSource.local);
      },
    );
  });

  // ==========================================================================
  // GROUP: تجميع اختبارات البحث
  // ==========================================================================
  // group(): تجميع الاختبارات المتعلقة بوظيفة البحث
  // 'searchProducts': اسم المجموعة - وظيفة البحث
  group('searchProducts', () {
    // test(): اختبار الحالة الناجحة للبحث
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // ====================================================================
        // ARRANGE - إعداد البيانات
        // ====================================================================
        // arrange

        // when(): تحديد السلوك المتوقع للبحث في Remote
        // mockRemoteDataSource.searchProducts('test'): عندما يتم البحث بكلمة 'test'
        // thenAnswer(): يجب أن تعيد هذه القيمة
        // (_) async => [tProductModel]: دالة غير متزامنة تعيد نتائج البحث
        // الهدف: محاكاة نجاح البحث في API
        when(
          mockRemoteDataSource.searchProducts('test'),
        ).thenAnswer((_) async => [tProductModel]);

        // ====================================================================
        // ACT - تنفيذ الكود
        // ====================================================================
        // act

        // await: انتظار اكتمال العملية
        // repository.searchProducts('test'): استدعاء البحث بكلمة 'test'
        // final result: النتيجة الفعلية
        final result = await repository.searchProducts('test');

        // ====================================================================
        // ASSERT - التحقق من النتائج
        // ====================================================================
        // assert

        // verify(): التأكد من استدعاء البحث في Remote
        verify(mockRemoteDataSource.searchProducts('test'));

        // expect(): التحقق من نتائج البحث
        // result.products: قائمة نتائج البحث الفعلية
        // [tProductModel]: القيمة المتوقعة
        expect(result.products, [tProductModel]);

        // expect(): التحقق من مصدر البيانات
        // result.source: مصدر البيانات الفعلي
        // DataSource.remote: القيمة المتوقعة (من API)
        expect(result.source, DataSource.remote);
      },
    );

    // test(): اختبار الحالة الفاشلة للبحث
    test(
      'should return local filtered data when the call to remote data source fails',
      () async {
        // ====================================================================
        // ARRANGE - إعداد البيانات (حالة الفشل)
        // ====================================================================
        // arrange

        // when(): تحديد السلوك المتوقع (الفشل)
        // mockRemoteDataSource.searchProducts('test'): عندما يتم البحث
        // thenThrow(): يجب أن ترمي استثناء
        // Exception('Network error'): نوع الاستثناء
        // الهدف: محاكاة فشل البحث في API
        when(
          mockRemoteDataSource.searchProducts('test'),
        ).thenThrow(Exception('Network error'));

        // when(): تحديد السلوك المتوقع للـ Local
        // mockLocalDataSource.searchProducts('test'): البحث في Local
        // thenAnswer(): يجب أن تعيد هذه القيمة
        // (_) async => [tProductModel]: دالة غير متزامنة تعيد نتائج البحث
        // [tProductModel]: قائمة المنتجات من Local
        // ملاحظة: Repository سيقوم بفلترة هذه القائمة محلياً
        when(
          mockLocalDataSource.searchProducts('test'),
        ).thenAnswer((_) async => [tProductModel]);

        // ====================================================================
        // ACT - تنفيذ الكود
        // ====================================================================
        // act

        // await: انتظار اكتمال العملية
        // repository.searchProducts('test'): استدعاء البحث
        // final result: النتيجة الفعلية (يجب أن تكون من Local بعد الفلترة)
        final result = await repository.searchProducts('test');

        // ====================================================================
        // ASSERT - التحقق من النتائج
        // ====================================================================
        // assert

        // verify(): التأكد من استدعاء البحث في Remote أولاً
        verify(mockRemoteDataSource.searchProducts('test'));

        // verify(): التأكد من استدعاء Local بعد الفشل
        verify(mockLocalDataSource.searchProducts('test'));

        // expect(): التحقق من نتائج البحث
        // result.products: قائمة نتائج البحث الفعلية (بعد الفلترة المحلية)
        // [tProductModel]: القيمة المتوقعة
        expect(result.products, [tProductModel]);

        // expect(): التحقق من مصدر البيانات
        // result.source: مصدر البيانات الفعلي
        // DataSource.local: القيمة المتوقعة (من Local بعد الفلترة)
        // الهدف: التأكد من أن Repository يستخدم Local عند الفشل
        expect(result.source, DataSource.local);
      },
    );
  });
}

// ============================================================================
// ملاحظات مهمة:
// ============================================================================
// 1. يجب تشغيل "dart run build_runner build" لإنشاء ملف .mocks.dart
// 2. Repository يعتمد على Data Sources - نستخدم Mocks لاختباره بشكل منعزل
// 3. نختبر حالتين: النجاح (Remote) والفشل (Local Fallback)
// 4. Fallback: آلية احتياطية - استخدام Local عند فشل Remote
// 5. verify(): للتأكد من استدعاء الدوال بالترتيب الصحيح
// ============================================================================
