import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/widgets/custom_my_text.dart';
import 'package:food_delivery/core/widgets/custom_text_fild.dart';
import 'package:food_delivery/features/product/presentation/state/product_state.dart';

import '../../data/models/product_model.dart';

class AddProductWidget extends StatelessWidget {
  const AddProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Add Product'),
            const SizedBox(height: 20),
            // Add product form
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                return Form(
                  key: key,
                  child: Column(
                    children: [
                      CustomTextFild(
                        controller: ref.watch(nameControllerProvider),
                        hintText: 'Name',
                        keyboardType: TextInputType.name,
                        validator: (data) {
                          if (data == null || data.isEmpty) {
                            return 'This is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextFild(
                        controller: ref.watch(priceControllerProvider),
                        hintText: 'Price',
                        keyboardType: TextInputType.number,
                        validator: (data) {
                          if (data == null || data.isEmpty) {
                            return 'This is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextFild(
                        controller: ref.watch(imagePathControllerProvider),
                        hintText: 'Image Path',
                        keyboardType: TextInputType.url,
                        validator: (data) {
                          if (data == null || data.isEmpty) {
                            return 'This is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextFild(
                        controller: ref.watch(descriptionControllerProvider),
                        hintText: 'Description',
                        keyboardType: TextInputType.text,
                        validator: (data) {
                          if (data == null || data.isEmpty) {
                            return 'This is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      DropdownButton<CategoryEnum>(
                        value: ref.watch(categoryControllerProvider),
                        items:
                            <CategoryEnum>[
                              CategoryEnum.recommended,
                              CategoryEnum.hottest,
                              CategoryEnum.newCombo,
                              CategoryEnum.popular,
                              CategoryEnum.top,
                            ].map<DropdownMenuItem<CategoryEnum>>((
                              CategoryEnum value,
                            ) {
                              return DropdownMenuItem<CategoryEnum>(
                                value: value,
                                child: Text(value.name),
                              );
                            }).toList(),
                        onChanged: (CategoryEnum? newValue) {
                          if (newValue != null) {
                            ref
                                .read(categoryControllerProvider.notifier)
                                .set(newValue);
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Ingredients (comma separated), .......',
                        ),
                        onChanged: (value) {
                          ref
                              .watch(ingredientsControllerProvider.notifier)
                              .setIngredients(value);
                        },
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () async {
                          if (key.currentState!.validate()) {
                            final name = ref.read(nameControllerProvider).text;
                            final price = double.parse(
                              ref.read(priceControllerProvider).text,
                            );
                            final imagePath = ref
                                .read(imagePathControllerProvider)
                                .text;
                            final description = ref
                                .read(descriptionControllerProvider)
                                .text;
                            final category = ref.read(
                              categoryControllerProvider,
                            );
                            final ingredients = ref.read(
                              ingredientsControllerProvider,
                            );
                            final product = ProductModel(
                              id: DateTime.now().millisecondsSinceEpoch
                                  .toString(),
                              name: name,
                              price: price,
                              imagePath: imagePath,
                              isFavorite: false,
                              category: category.name,
                              description: description,
                              ingredients: ingredients,
                            );
                            await ref
                                .watch(addProductProvider.notifier)
                                .add(product)
                                .then((value) {
                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                });
                          }
                        },
                        child: MyText(text: 'Add'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
