# عرض تقديمي: الاختبارات في Flutter
## Testing in Flutter - Presentation

---

## الشريحة 1: العنوان

# الاختبارات في Flutter
## Testing in Flutter

**الهدف**: فهم كيفية كتابة اختبارات شاملة للتطبيقات

---

## الشريحة 2: المحتويات

### ما سنتعلمه:
1. أنواع الاختبارات
2. Unit Testing
3. Widget Testing
4. Integration Testing
5. أدوات الاختبار
6. Best Practices

---

## الشريحة 3: لماذا الاختبارات؟

### الفوائد:
- ✅ **اكتشاف الأخطاء مبكراً**
- ✅ **الثقة في الكود**
- ✅ **توثيق الكود**
- ✅ **تسهيل التطوير**
- ✅ **منع التراجع (Regression)**

---

## الشريحة 4: أنواع الاختبارات

### 1. Unit Test (اختبار الوحدة)
- اختبار وحدة واحدة من الكود
- سريع جداً
- منعزل عن باقي الكود

### 2. Widget Test (اختبار الواجهة)
- اختبار Widget واحد أو مجموعة
- يختبر UI
- سريع

### 3. Integration Test (اختبار التكامل)
- اختبار التطبيق بالكامل
- يختبر جميع الطبقات
- بطيء نسبياً

---

## الشريحة 5: Unit Test - المفهوم

### ما هو؟
- اختبار class أو function واحد
- بشكل منعزل عن باقي الكود
- يستخدم Mocks لمحاكاة التبعيات

### مثال:
```dart
test('should return products', () {
  // اختبار UseCase
});
```

---

## الشريحة 6: Unit Test - البنية

### AAA Pattern:
1. **Arrange** (إعداد)
   - إعداد البيانات
   - إعداد Mocks

2. **Act** (تنفيذ)
   - استدعاء الكود

3. **Assert** (التحقق)
   - التحقق من النتائج

---

## الشريحة 7: Unit Test - مثال كامل

```dart
@GenerateMocks([ProductRepository])
void main() {
  late GetProductsUsecase useCase;
  late MockProductRepository mockRepository;
  
  setUp(() {
    mockRepository = MockProductRepository();
    useCase = GetProductsUsecase(mockRepository);
  });
  
  test('should get products', () async {
    // Arrange
    when(mockRepository.getProducts())
        .thenAnswer((_) async => tProductResult);
    
    // Act
    final result = await useCase();
    
    // Assert
    expect(result, equals(tProductResult));
    verify(mockRepository.getProducts());
  });
}
```

---

## الشريحة 8: Mocks - المفهوم

### ما هو Mock؟
- كائن وهمي يحاكي السلوك الحقيقي
- لا يحتاج اتصال بالشبكة أو قاعدة البيانات
- سريع وموثوق

### متى نستخدمه؟
- عند اختبار UseCase (يعتمد على Repository)
- عند اختبار Repository (يعتمد على DataSource)
- أي تبعية خارجية

---

## الشريحة 9: Mockito - الأدوات

### when() - محاكاة السلوك
```dart
when(mock.method()).thenReturn(value);
when(mock.method()).thenAnswer((_) => value);
when(mock.method()).thenThrow(Exception());
```

### verify() - التحقق من الاستدعاء
```dart
verify(mock.method());
verify(mock.method()).called(1);
verifyNoMoreInteractions(mock);
```

---

## الشريحة 10: Widget Test - المفهوم

### ما هو؟
- اختبار Widget واحد أو مجموعة
- يختبر UI و التفاعلات
- يستخدم WidgetTester

### مثال:
```dart
testWidgets('should display text', (tester) async {
  await tester.pumpWidget(MyWidget());
  expect(find.text('Hello'), findsOneWidget);
});
```

---

## الشريحة 11: Widget Test - البنية

```dart
testWidgets('test name', (WidgetTester tester) async {
  // 1. بناء Widget
  await tester.pumpWidget(
    MaterialApp(home: MyWidget()),
  );
  
  // 2. التفاعل (اختياري)
  await tester.tap(find.byIcon(Icons.add));
  
  // 3. التحقق
  expect(find.text('Result'), findsOneWidget);
});
```

---

## الشريحة 12: Widget Test - مثال كامل

```dart
testWidgets('HomePage displays search bar', (tester) async {
  // Arrange
  final tProductResult = ProductResult(
    products: [tProduct],
    source: DataSource.remote,
  );
  
  // Act
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        recommendedProductsProvider.overrideWithValue(
          AsyncValue.data(tProductResult),
        ),
      ],
      child: MaterialApp(home: HomePage()),
    ),
  );
  
  // Assert
  expect(find.text('Search'), findsOneWidget);
});
```

---

## الشريحة 13: WidgetTester - الأدوات

### البناء
```dart
await tester.pumpWidget(widget);
await tester.pump();
await tester.pumpAndSettle();
```

### التفاعل
```dart
await tester.tap(find.byIcon(Icons.add));
await tester.enterText(find.byType(TextField), 'text');
await tester.drag(find.byType(ListView), Offset(0, -100));
```

### البحث
```dart
find.text('Hello')
find.byIcon(Icons.add)
find.byType(TextField)
find.byKey(Key('myKey'))
```

---

## الشريحة 14: Integration Test - المفهوم

### ما هو؟
- اختبار التطبيق بالكامل
- من البداية للنهاية
- يختبر جميع الطبقات معاً

### مثال:
```dart
testWidgets('user flow', (tester) async {
  app.main();
  await tester.pumpAndSettle();
  // اختبار السيناريو الكامل
});
```

---

## الشريحة 15: Integration Test - مثال

```dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets('complete user flow', (tester) async {
    // بدء التطبيق
    app.main();
    await tester.pumpAndSettle();
    
    // البحث عن widget
    final searchBar = find.byType(TextField);
    expect(searchBar, findsOneWidget);
    
    // التفاعل
    await tester.tap(searchBar);
    await tester.enterText(searchBar, 'fruit');
    await tester.pumpAndSettle();
    
    // التحقق
    expect(find.text('نتائج البحث'), findsOneWidget);
  });
}
```

---

## الشريحة 16: Matchers - المطابقات

### للمساواة
```dart
expect(value, equals(5));
expect(value, 5); // اختصار
```

### للنوع
```dart
expect(value, isA<int>());
expect(value, isA<String>());
```

### للقيم المنطقية
```dart
expect(value, isTrue);
expect(value, isFalse);
expect(value, isNull);
```

### للـ Widgets
```dart
expect(find.text('Hello'), findsOneWidget);
expect(find.text('Hello'), findsWidgets);
expect(find.text('Hello'), findsNothing);
```

---

## الشريحة 17: Best Practices - 1

### 1. أسماء وصفية
```dart
// ❌ سيء
test('test1', () {});

// ✅ جيد
test('should return products when repository succeeds', () {});
```

### 2. اختبار واحد = فكرة واحدة
```dart
// ❌ سيء
test('test everything', () {
  // 10 اختبارات مختلفة
});

// ✅ جيد
test('should return products', () {});
test('should return correct count', () {});
```

---

## الشريحة 18: Best Practices - 2

### 3. استخدام setUp()
```dart
setUp(() {
  mockRepository = MockRepository();
  useCase = UseCase(mockRepository);
});
```

### 4. اختبار الحالات الحدية
```dart
test('should handle empty list', () {});
test('should handle null values', () {});
test('should handle large numbers', () {});
```

### 5. استخدام Constants
```dart
const tProductId = '1';
final tProduct = Product(id: tProductId, ...);
```

---

## الشريحة 19: أخطاء شائعة - 1

### 1. نسيان ProviderScope
```dart
// ❌ خطأ
await tester.pumpWidget(HomePage());

// ✅ صحيح
await tester.pumpWidget(
  ProviderScope(child: MaterialApp(home: HomePage())),
);
```

### 2. نسيان MaterialApp
```dart
// ❌ خطأ
await tester.pumpWidget(MyWidget());

// ✅ صحيح
await tester.pumpWidget(MaterialApp(home: MyWidget()));
```

---

## الشريحة 20: أخطاء شائعة - 2

### 3. نسيان build_runner
```bash
# يجب تشغيله قبل Unit Tests
dart run build_runner build
```

### 4. نسيان await
```dart
// ❌ خطأ
tester.pumpWidget(widget);

// ✅ صحيح
await tester.pumpWidget(widget);
```

---

## الشريحة 21: تشغيل الاختبارات

### الأوامر:
```bash
# جميع الاختبارات
flutter test

# اختبار محدد
flutter test test/features/home/page/home_page_test.dart

# Integration Test
flutter test integration_test/app_test.dart

# مع Coverage
flutter test --coverage
```

---

## الشريحة 22: Test Coverage

### ما هو؟
- نسبة الكود المختبر
- الهدف: 80%+ coverage

### كيفية الحصول عليه:
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

---

## الشريحة 23: الخلاصة - 1

### Unit Test:
- ✅ سريع جداً
- ✅ يختبر وحدة واحدة
- ✅ يستخدم Mocks
- ✅ للـ Domain و Data Layers

### Widget Test:
- ✅ سريع
- ✅ يختبر UI
- ✅ يستخدم WidgetTester
- ✅ للـ Presentation Layer

---

## الشريحة 24: الخلاصة - 2

### Integration Test:
- ✅ بطيء نسبياً
- ✅ يختبر التطبيق بالكامل
- ✅ يختبر جميع الطبقات
- ✅ للسيناريوهات الكاملة

### المبادئ:
- ✅ AAA Pattern
- ✅ Test Isolation
- ✅ Descriptive Names
- ✅ One Test = One Idea

---

## الشريحة 25: المراجع

### الوثائق الرسمية:
- [Flutter Testing](https://docs.flutter.dev/testing)
- [Mockito](https://pub.dev/packages/mockito)
- [Riverpod Testing](https://riverpod.dev/docs/concepts/testing)

### الملفات:
- `docs/TESTING_GUIDE_AR.md` - دليل شامل
- `docs/TESTING_EXAMPLES_AR.md` - أمثلة عملية

---

## الشريحة 26: الأسئلة

# شكراً لكم!
## Questions?

---

## ملاحظات إضافية للمحاضر:

### نقاط مهمة للتأكيد:
1. **AAA Pattern** - دائماً اتبع Arrange, Act, Assert
2. **Test Isolation** - كل اختبار مستقل
3. **Mocks** - فقط للتبعيات الخارجية
4. **Descriptive Names** - أسماء واضحة ووصفية
5. **One Test = One Idea** - اختبار واحد لفكرة واحدة

### أمثلة عملية:
- اكتب اختبار أمام الطلاب
- اشرح كل سطر
- أظهر الأخطاء الشائعة
- أظهر كيفية إصلاحها

### الوقت المقترح:
- Unit Test: 20 دقيقة
- Widget Test: 20 دقيقة
- Integration Test: 10 دقائق
- Best Practices: 10 دقائق
- الأسئلة: 10 دقائق

**المجموع**: ~70 دقيقة

