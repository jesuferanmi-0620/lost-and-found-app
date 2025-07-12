import 'dart:io';
import 'package:flutter/material.dart';
import '/widget/custom_text_field.dart';
import '/widget/section_header.dart';
import '/widget/image_picker_box.dart';
import '/widget/custom_dropdown.dart';

class reportlostitem extends StatefulWidget {
  const reportlostitem({super.key});

  @override
  State<reportlostitem> createState() => _reportlostitemState();
}

class _reportlostitemState extends State<reportlostitem> {
  final _formKey = GlobalKey<FormState>();
  final categories = ['Electronics', 'Books', 'Clothing', 'Others'];
  String? selectedCategory;
  File? selectedImage;

  // Controllers
  final itemNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final brandController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final rewardController = TextEditingController();
  final rewardInfoController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    itemNameController.dispose();
    descriptionController.dispose();
    brandController.dispose();
    locationController.dispose();
    dateController.dispose();
    timeController.dispose();
    rewardController.dispose();
    rewardInfoController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lost item reported')),
      );

      // Upload to backend (optional)
      // Use selectedImage if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Lost Item'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(title: '📷 Photos'),
              const SizedBox(height: 8),
              ImagePickerBox(
                onImageSelected: (image) {
                  setState(() {
                    selectedImage = image;
                  });
                },
              ),
              const SizedBox(height: 20),

              const SectionHeader(title: '🧾 Item Details'),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Item Name',
                controller: itemNameController,
                validator: (val) => val!.isEmpty ? 'Item name is required' : null,
              ),
              const SizedBox(height: 10),
              CustomDropdown(
                label: 'Category',
                selectedValue: selectedCategory,
                items: categories,
                onChanged: (val) => setState(() => selectedCategory = val),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Description',
                controller: descriptionController,
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Brand/Model',
                controller: brandController,
              ),

              const SizedBox(height: 20),
              const SectionHeader(title: '📍 Where & When'),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Last Known Location',
                controller: locationController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Date Lost',
                controller: dateController,
                inputType: TextInputType.datetime,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Approximate Time',
                controller: timeController,
              ),

              const SizedBox(height: 20),
              const SectionHeader(title: '💰 Reward (Optional)'),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Offer in ₦ (Optional)',
                controller: rewardController,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Other Reward Info',
                controller: rewardInfoController,
              ),

              const SizedBox(height: 20),
              const SectionHeader(title: '📞 Contact Information'),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Your Name',
                controller: nameController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Phone Number',
                controller: phoneController,
                inputType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: 'Email Address',
                controller: emailController,
                inputType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _submitForm,
                child: const Text('Report Lost Item'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message, color: Colors.blue),
                  label: const Text('Message', style: TextStyle(color: Colors.blue)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  label: const Text('Call Now'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
