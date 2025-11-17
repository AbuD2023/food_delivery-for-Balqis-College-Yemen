# مرجع سريع للاختبارات - Quick Reference

## 📋 Unit Test

### البنية الأساسية
```dart
@GenerateMocks([Repository])
void main() {
  late UseCase useCase;
  late MockRepository mockRepository;
  
  setUp(() {
    mockRepository = MockRepository();
    useCase = UseCase(mockRepository);
  });
  
  test('should do something', () async {
    // Arrange
    when(mock.method()).thenAnswer((_) async => value);
    
    // Act
    final result = await useCase();
    
    // Assert
    expect(result, equals(expected));
    verify(mock.method());
  });
}
```

### Mockito الأساسيات
```dart
// محاكاة السلوك
when(mock.method()).thenReturn(value);
when(mock.method()).thenAnswer((_) async => value);
when(mock.method()).thenThrow(Exception());

// التحقق
verify(mock.method());
verify(mock.method()).called(1);
verifyNoMoreInteractions(mock);
```

---

## 📋 Widget Test

### البنية الأساسية
```dart
testWidgets('test name', (WidgetTester tester) async {
  // Arrange & Act
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        provider.overrideWithValue(value),
      ],
      child: MaterialApp(home: MyWidget()),
    ),
  );
  
  // Assert
  expect(find.text('Hello'), findsOneWidget);
});
```

### WidgetTester الأساسيات
```dart
// البناء
await tester.pumpWidget(widget);
await tester.pump();
await tester.pumpAndSettle();

// التفاعل
await tester.tap(find.byIcon(Icons.add));
await tester.enterText(find.byType(TextField), 'text');
await tester.drag(find.byType(ListView), Offset(0, -100));

// البحث
find.text('Hello')
find.byIcon(Icons.add)
find.byType(TextField)
find.byKey(Key('key'))
```

---

## 📋 Integration Test

### البنية الأساسية
```dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets('user flow', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    
    // اختبار السيناريو الكامل
  });
}
```

---

## 📋 Matchers

### المساواة والنوع
```dart
expect(value, equals(5));
expect(value, 5); // اختصار
expect(value, isA<int>());
expect(value, isA<String>());
```

### القيم المنطقية
```dart
expect(value, isTrue);
expect(value, isFalse);
expect(value, isNull);
expect(value, isNotNull);
```

### النصوص
```dart
expect(text, contains('hello'));
expect(text, startsWith('h'));
expect(text, endsWith('o'));
```

### القوائم
```dart
expect(list, isEmpty);
expect(list, isNotEmpty);
expect(list, hasLength(5));
expect(list, contains('item'));
```

### Widgets
```dart
expect(find.text('Hello'), findsOneWidget);
expect(find.text('Hello'), findsWidgets);
expect(find.text('Hello'), findsNothing);
expect(find.text('Hello'), findsAtLeastNWidgets(2));
```

---

## 📋 الأوامر

### تشغيل الاختبارات
```bash
# جميع الاختبارات
flutter test

# اختبار محدد
flutter test test/path/to/test.dart

# Integration Test
flutter test integration_test/app_test.dart

# مع Coverage
flutter test --coverage
```

### إنشاء Mocks
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 📋 AAA Pattern

```dart
test('test name', () {
  // Arrange - إعداد البيانات
  final data = TestData();
  
  // Act - تنفيذ الكود
  final result = function(data);
  
  // Assert - التحقق من النتائج
  expect(result, equals(expected));
});
```

---

## 📋 Best Practices

### ✅ افعل
- استخدم أسماء وصفية
- اختبار واحد = فكرة واحدة
- استخدم setUp() للتهيئة
- اختبر الحالات الحدية
- استخدم Constants للبيانات

### ❌ لا تفعل
- أسماء غير واضحة
- اختبارات معتمدة على بعضها
- نسيان ProviderScope
- نسيان MaterialApp
- نسيان await

---

## 📋 أخطاء شائعة

### 1. نسيان ProviderScope
```dart
// ❌
await tester.pumpWidget(HomePage());

// ✅
await tester.pumpWidget(
  ProviderScope(child: MaterialApp(home: HomePage())),
);
```

### 2. نسيان MaterialApp
```dart
// ❌
await tester.pumpWidget(MyWidget());

// ✅
await tester.pumpWidget(MaterialApp(home: MyWidget()));
```

### 3. نسيان build_runner
```bash
# يجب تشغيله قبل Unit Tests
dart run build_runner build
```

### 4. نسيان await
```dart
// ❌
tester.pumpWidget(widget);

// ✅
await tester.pumpWidget(widget);
```

---

## 📋 Checklist

### قبل كتابة الاختبار:
- [ ] هل فهمت ما أريد اختباره؟
- [ ] هل أعددت البيانات الاختبارية؟
- [ ] هل أعددت Mocks (إن لزم الأمر)؟

### أثناء كتابة الاختبار:
- [ ] هل اتبعت AAA Pattern؟
- [ ] هل الاسم وصفي؟
- [ ] هل الاختبار مستقل؟

### بعد كتابة الاختبار:
- [ ] هل الاختبار يعمل؟
- [ ] هل يختبر ما أريد؟
- [ ] هل الكود واضح؟

---

## 📋 أنواع الاختبارات

| النوع | السرعة | المستوى | الاستخدام |
|------|--------|---------|-----------|
| Unit Test | سريع جداً | Domain/Data | UseCases, Repositories |
| Widget Test | سريع | Presentation | Widgets, Pages |
| Integration Test | بطيء | جميع الطبقات | سيناريوهات كاملة |

---

## 📋 الملفات المهمة

- `docs/TESTING_GUIDE_AR.md` - دليل شامل
- `docs/TESTING_EXAMPLES_AR.md` - أمثلة عملية
- `docs/PRESENTATION_TESTING.md` - عرض تقديمي
- `docs/TESTING_QUICK_REFERENCE.md` - هذا الملف

---

## 📋 روابط سريعة

- [Flutter Testing](https://docs.flutter.dev/testing)
- [Mockito](https://pub.dev/packages/mockito)
- [Riverpod Testing](https://riverpod.dev/docs/concepts/testing)

