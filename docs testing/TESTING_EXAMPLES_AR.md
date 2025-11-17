# أمثلة عملية وتوضيحات إضافية للاختبارات

## 📋 جدول المحتويات

1. [مثال عملي: Unit Test كامل](#مثال-عملي-unit-test-كامل)
2. [مثال عملي: Widget Test كامل](#مثال-عملي-widget-test-كامل)
3. [أخطاء شائعة وحلولها](#أخطاء-شائعة-وحلولها)
4. [أدوات مفيدة في الاختبارات](#أدوات-مفيدة-في-الاختبارات)
5. [Best Practices](#best-practices)

---

## مثال عملي: Unit Test كامل

### السيناريو: اختبار UseCase لإضافة منتج للسلة

```dart
// الكود الأصلي
class AddToCartUsecase {
  final CartRepository repository;
  
  AddToCartUsecase(this.repository);
  
  Future<void> call(String productId, int quantity) async {
    await repository.addToCart(productId, quantity);
  }
}
```

### الاختبار:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:food_delivery/features/cart/domain/repositories/cart_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_to_cart_usecase_test.mocks.dart';

@GenerateMocks([CartRepository])
void main() {
  // 1. تعريف المتغيرات
  late AddToCartUsecase useCase;
  late MockCartRepository mockRepository;
  
  // 2. تهيئة قبل كل اختبار
  setUp(() {
    mockRepository = MockCartRepository();
    useCase = AddToCartUsecase(mockRepository);
  });
  
  // 3. بيانات الاختبار
  const tProductId = 'product-123';
  const tQuantity = 2;
  
  // 4. الاختبارات
  group('AddToCartUsecase', () {
    test('should add product to cart successfully', () async {
      // Arrange
      when(mockRepository.addToCart(tProductId, tQuantity))
          .thenAnswer((_) async => Future.value());
      
      // Act
      await useCase(tProductId, tQuantity);
      
      // Assert
      verify(mockRepository.addToCart(tProductId, tQuantity)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
    
    test('should throw exception when repository fails', () async {
      // Arrange
      when(mockRepository.addToCart(tProductId, tQuantity))
          .thenThrow(Exception('Network error'));
      
      // Act & Assert
      expect(
        () => useCase(tProductId, tQuantity),
        throwsA(isA<Exception>()),
      );
    });
  });
}
```

### شرح مفصل:

#### 1. تعريف المتغيرات
```dart
late AddToCartUsecase useCase;
late MockCartRepository mockRepository;
```
- `late`: نستخدمها لأننا سنقوم بالتهيئة في `setUp()`
- **لماذا؟**: لأن `setUp()` يتم تنفيذه قبل كل اختبار

#### 2. setUp()
```dart
setUp(() {
  mockRepository = MockCartRepository();
  useCase = AddToCartUsecase(mockRepository);
});
```
- **الهدف**: ضمان أن كل اختبار يبدأ بحالة نظيفة
- **متى يتم تنفيذه**: قبل كل `test()` أو `testWidgets()`

#### 3. بيانات الاختبار
```dart
const tProductId = 'product-123';
const tQuantity = 2;
```
- **الاصطلاح**: استخدام `t` كبادئة (test data)
- `const`: لأن القيم ثابتة

#### 4. when() - محاكاة السلوك
```dart
when(mockRepository.addToCart(tProductId, tQuantity))
    .thenAnswer((_) async => Future.value());
```
- `when()`: يحدد متى يتم استدعاء الدالة
- `thenAnswer()`: يحدد ما يجب أن تعيده
- `(_) async =>`: دالة غير متزامنة

#### 5. verify() - التحقق من الاستدعاء
```dart
verify(mockRepository.addToCart(tProductId, tQuantity)).called(1);
```
- `verify()`: يتحقق من أن الدالة تم استدعاؤها
- `.called(1)`: مرة واحدة بالضبط

#### 6. verifyNoMoreInteractions()
```dart
verifyNoMoreInteractions(mockRepository);
```
- **الهدف**: التأكد من عدم وجود استدعاءات أخرى غير متوقعة

#### 7. اختبار الأخطاء
```dart
when(mockRepository.addToCart(tProductId, tQuantity))
    .thenThrow(Exception('Network error'));

expect(
  () => useCase(tProductId, tQuantity),
  throwsA(isA<Exception>()),
);
```
- `thenThrow()`: محاكاة خطأ
- `throwsA(isA<Exception>())`: التحقق من نوع الاستثناء

---

## مثال عملي: Widget Test كامل

### السيناريو: اختبار ProductCard Widget

```dart
// الكود الأصلي
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCart;
  
  const ProductCard({
    required this.product,
    this.onFavoriteTap,
    this.onAddToCart,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(product.name),
          Text('${product.price}'),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: onFavoriteTap,
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: onAddToCart,
          ),
        ],
      ),
    );
  }
}
```

### الاختبار:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery/features/product/presentation/widgets/product_card.dart';
import 'package:food_delivery/features/product/domain/entities/product.dart';

void main() {
  // بيانات الاختبار
  final tProduct = Product(
    id: '1',
    name: 'Test Product',
    price: 10.0,
    imagePath: 'test.png',
    category: 'recommended',
  );
  
  group('ProductCard', () {
    testWidgets('should display product name and price', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: tProduct),
          ),
        ),
      );
      
      // Assert
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
    });
    
    testWidgets('should call onFavoriteTap when favorite button is tapped', (tester) async {
      // Arrange
      bool favoriteTapped = false;
      
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              product: tProduct,
              onFavoriteTap: () {
                favoriteTapped = true;
              },
            ),
          ),
        ),
      );
      
      // Find and tap favorite button
      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pump();
      
      // Assert
      expect(favoriteTapped, isTrue);
    });
    
    testWidgets('should call onAddToCart when add button is tapped', (tester) async {
      // Arrange
      bool addToCartTapped = false;
      
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              product: tProduct,
              onAddToCart: () {
                addToCartTapped = true;
              },
            ),
          ),
        ),
      );
      
      // Find and tap add button
      await tester.tap(find.byIcon(Icons.add_shopping_cart));
      await tester.pump();
      
      // Assert
      expect(addToCartTapped, isTrue);
    });
  });
}
```

### شرح مفصل:

#### 1. pumpWidget()
```dart
await tester.pumpWidget(
  MaterialApp(
    home: Scaffold(
      body: ProductCard(product: tProduct),
    ),
  ),
);
```
- **الهدف**: بناء Widget في بيئة الاختبار
- **لماذا MaterialApp؟**: بعض Widgets تحتاج MaterialApp للعمل
- **لماذا Scaffold؟**: لتوفير بنية أساسية

#### 2. find.text()
```dart
expect(find.text('Test Product'), findsOneWidget);
```
- `find.text()`: البحث عن نص
- `findsOneWidget`: يجب أن يكون widget واحد فقط

#### 3. find.byIcon()
```dart
await tester.tap(find.byIcon(Icons.favorite));
```
- `find.byIcon()`: البحث عن widget حسب الأيقونة
- `tap()`: النقر على Widget

#### 4. pump() vs pumpAndSettle()
```dart
await tester.pump(); // frame واحد
await tester.pumpAndSettle(); // جميع الـ frames
```
- `pump()`: انتظار frame واحد
- `pumpAndSettle()`: انتظار جميع الـ frames والرسوم المتحركة

#### 5. اختبار Callbacks
```dart
bool favoriteTapped = false;

onFavoriteTap: () {
  favoriteTapped = true;
},

// بعد النقر
expect(favoriteTapped, isTrue);
```
- **الهدف**: التحقق من استدعاء callback
- استخدام متغير boolean لتتبع الاستدعاء

---

## أخطاء شائعة وحلولها

### 1. خطأ: "NoSuchMethodError: The method 'X' was called on null"

**السبب**: استخدام widget يحتاج ProviderScope بدون توفيره

**الحل**:
```dart
// ❌ خطأ
await tester.pumpWidget(HomePage());

// ✅ صحيح
await tester.pumpWidget(
  ProviderScope(
    child: MaterialApp(home: HomePage()),
  ),
);
```

### 2. خطأ: "TimeoutException: Test timed out"

**السبب**: `pumpAndSettle()` ينتظر إلى ما لا نهاية

**الحل**:
```dart
// ❌ خطأ
await tester.pumpAndSettle();

// ✅ صحيح
await tester.pumpAndSettle(const Duration(seconds: 5));
```

### 3. خطأ: "Mock was not used"

**السبب**: استخدام `verify()` بدون استدعاء الدالة

**الحل**:
```dart
// ❌ خطأ
verify(mockRepository.getProducts());

// ✅ صحيح
final result = await useCase();
verify(mockRepository.getProducts());
```

### 4. خطأ: "The argument type 'X' can't be assigned to parameter type 'Y'"

**السبب**: نوع البيانات غير متطابق

**الحل**:
```dart
// ❌ خطأ
overrideWithValue(null)

// ✅ صحيح
overrideWithValue(AsyncValue.data(result))
```

### 5. خطأ: "Widget not found"

**السبب**: البحث عن widget غير موجود

**الحل**:
```dart
// ❌ خطأ
expect(find.text('NonExistent'), findsOneWidget);

// ✅ صحيح
expect(find.text('NonExistent'), findsNothing);
// أو استخدام find.byType() أو find.byKey()
```

---

## أدوات مفيدة في الاختبارات

### 1. Matchers (مطابقات)

```dart
// المساواة
expect(value, equals(5));
expect(value, 5); // اختصار

// النوع
expect(value, isA<int>());
expect(value, isA<String>());

// القيم المنطقية
expect(value, isTrue);
expect(value, isFalse);
expect(value, isNull);
expect(value, isNotNull);

// النصوص
expect(text, contains('hello'));
expect(text, startsWith('h'));
expect(text, endsWith('o'));

// القوائم
expect(list, isEmpty);
expect(list, isNotEmpty);
expect(list, hasLength(5));
expect(list, contains('item'));

// Widgets
expect(find.text('Hello'), findsOneWidget);
expect(find.text('Hello'), findsWidgets);
expect(find.text('Hello'), findsNothing);
expect(find.text('Hello'), findsAtLeastNWidgets(2));
```

### 2. WidgetTester Methods

```dart
// البناء
await tester.pumpWidget(widget);
await tester.pump(); // frame واحد
await tester.pumpAndSettle(); // جميع الـ frames

// التفاعل
await tester.tap(find.byIcon(Icons.add));
await tester.tapAt(Offset(100, 200)); // النقر في مكان محدد
await tester.longPress(find.text('Hello'));
await tester.drag(find.byType(ListView), Offset(0, -100));
await tester.fling(find.byType(ListView), Offset(0, -100), 1000);

// إدخال النص
await tester.enterText(find.byType(TextField), 'Hello');
await tester.showKeyboard(find.byType(TextField));
await tester.hideKeyboard();

// البحث
final widget = tester.widget<Text>(find.text('Hello'));
final element = tester.element(find.text('Hello'));
final renderObject = tester.renderObject(find.text('Hello'));

// التحقق
expect(tester.takeException(), isNull);
expect(tester.allWidgets, isNotEmpty);
```

### 3. Mockito Methods

```dart
// محاكاة السلوك
when(mock.method()).thenReturn(value);
when(mock.method()).thenAnswer((_) => value);
when(mock.method()).thenThrow(Exception());

// التحقق
verify(mock.method());
verify(mock.method()).called(1);
verify(mock.method()).called(greaterThan(1));
verifyNever(mock.method());
verifyNoMoreInteractions(mock);
verifyInOrder([mock.method1(), mock.method2()]);

// Argument Matchers
when(mock.method(any)).thenReturn(value);
when(mock.method(anyNamed('param'))).thenReturn(value);
when(mock.method(argThat(predicate))).thenReturn(value);
```

---

## Best Practices

### 1. أسماء الاختبارات

```dart
// ❌ سيء
test('test1', () {});

// ✅ جيد
test('should return products when repository succeeds', () {});
test('should throw exception when network fails', () {});
```

**النمط الموصى به**: `should [expected behavior] when [condition]`

### 2. تنظيم الاختبارات

```dart
group('GetProductsUsecase', () {
  group('when repository succeeds', () {
    test('should return products', () {});
    test('should return correct number of products', () {});
  });
  
  group('when repository fails', () {
    test('should throw exception', () {});
    test('should throw correct exception type', () {});
  });
});
```

### 3. استخدام setUp() و tearDown()

```dart
setUp(() {
  // إعداد قبل كل اختبار
  mockRepository = MockRepository();
  useCase = UseCase(mockRepository);
});

tearDown(() {
  // تنظيف بعد كل اختبار (اختياري)
  // معظم الحالات لا تحتاج tearDown()
});
```

### 4. اختبار الحالات الحدية

```dart
// القيم الفارغة
test('should handle empty list', () {});

// القيم الكبيرة
test('should handle large numbers', () {});

// القيم السالبة
test('should handle negative values', () {});

// القيم null
test('should handle null values', () {});
```

### 5. استخدام Constants للبيانات الاختبارية

```dart
// ❌ سيء
test('test', () {
  final product = Product(id: '1', name: 'Test', ...);
});

// ✅ جيد
const tProductId = '1';
const tProductName = 'Test Product';
final tProduct = Product(id: tProductId, name: tProductName, ...);

test('test', () {
  // استخدام tProduct
});
```

### 6. اختبار واحد = فكرة واحدة

```dart
// ❌ سيء
test('test everything', () {
  // اختبار 10 أشياء مختلفة
});

// ✅ جيد
test('should return products', () {
  // اختبار واحد فقط
});

test('should return correct count', () {
  // اختبار آخر
});
```

### 7. استخدام Descriptive Assertions

```dart
// ❌ سيء
expect(result, isTrue);

// ✅ جيد
expect(result, isTrue, reason: 'Should return true when product exists');
```

---

## نصائح إضافية

1. **اختبار الأخطاء أولاً**: ابدأ باختبار الحالات الفاشلة
2. **استخدم `group()`**: لتنظيم الاختبارات المتعلقة
3. **تجنب الاختبارات المعتمدة**: كل اختبار مستقل
4. **استخدم Mocks بحكمة**: فقط للتبعيات الخارجية
5. **اكتب اختبارات قابلة للقراءة**: الكود يجب أن يكون واضحاً
6. **احتفظ بالاختبارات بسيطة**: لا تعقد الاختبارات
7. **راجع الاختبارات بانتظام**: تأكد من أنها ما زالت صالحة

---

## الخلاصة

- **Unit Test**: اختبار الوحدات بشكل منعزل
- **Widget Test**: اختبار UI و Widgets
- **Integration Test**: اختبار التطبيق بالكامل
- **AAA Pattern**: Arrange, Act, Assert
- **Mocks**: لمحاكاة التبعيات
- **Best Practices**: اتباع الممارسات الجيدة

---

## المراجع

- [Flutter Testing Cookbook](https://docs.flutter.dev/cookbook/testing)
- [Effective Dart: Testing](https://dart.dev/guides/language/effective-dart/testing)
- [Mockito Documentation](https://pub.dev/packages/mockito)

