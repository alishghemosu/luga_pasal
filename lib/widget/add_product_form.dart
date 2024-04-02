import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:eshop/models/product_models.dart';
import 'package:eshop/service%20or%20provider/product_list_provider.dart';

List<String> categories = [
  'Mens',
  'Womens',
  'Kids',
  'Pets',
  'Others',
];

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: const AddProductForm(),
    );
  }
}

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  File? _image;
  String _selectedCategory = categories.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Product Name',
            ),
          ),
          _image != null
              ? Image.file(
                  _image!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                )
              : Container(),
          ElevatedButton(
            onPressed: () {
              _getImage();
            },
            child: const Text('Pick Image'),
          ),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedCategory = newValue;
                });
              }
            },
            items: categories.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
          ),
          TextFormField(
            controller: _priceController,
            decoration: const InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final product = Product(
                name: _nameController.text,
                imageUrl: _image != null ? _image!.path : '',
                price: double.tryParse(_priceController.text) ?? 0.0,
                category: _selectedCategory,
              );
              Provider.of<AddProductListProvider>(context, listen: false)
                  .addProduct(product);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    } else {
      ('No image selected.');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
