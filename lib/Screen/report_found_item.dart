import 'dart:io';
import 'package:flutter/material.dart';
import '/widget/custom_text_field.dart';
import '/widget/section_header.dart';
import '/widget/custom_dropdown.dart';
import '/widget/image_picker_box.dart';

class reportfounditem extends StatefulWidget {
  const reportfounditem({super.key});

  @override
  State<reportfounditem> createState() => _reportfounditemState();
}

class _reportfounditemState extends State<reportfounditem> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCategory;
  File? selectedImage;

  final itemNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final brandController = TextEditingController();
  final foundLocationController = TextEditingController();
  final dateFoundController = TextEditingController();
  final timeFoundController = TextEditingController();
  final rewardController = TextEditingController();
  final rewardInfoController = TextEditingController();
  final pickupLocationController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  final categories = ['Electronics', 'Books', 'Clothing', 'Others'];

  @override
  void dispose() {
    itemNameController.dispose();
    descriptionController.dispose();
    brandController.dispose();
    foundLocationController.dispose();
    dateFoundController.dispose();
    timeFoundController.dispose();
    rewardController.dispose();
    rewardInfoController.dispose();
    pickupLocationController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Found Item'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(title: '📷 Photo of Found Item'),
                const SizedBox(height: 8),
                ImagePickerBox(onImageSelected: (image) => selectedImage = image),
                const SizedBox(height: 20),

                const SectionHeader(title: '🧾 Item Details'),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Item Name',
                  controller: itemNameController,
                  validator: _required,
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
                const SectionHeader(title: '📍 Where & When Found'),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Location Found',
                  controller: foundLocationController,
                  validator: _required,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Date Found',
                  controller: dateFoundController,
                  inputType: TextInputType.datetime,
                  validator: _required,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Approximate Time',
                  controller: timeFoundController,
                ),

                const SizedBox(height: 20),
                const SectionHeader(title: '💰 Optional Reward'),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Reward in ₦',
                  controller: rewardController,
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Reward Info',
                  controller: rewardInfoController,
                ),

                const SizedBox(height: 20),
                const SectionHeader(title: '📦 Suggested Pickup Location'),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Pickup Location',
                  controller: pickupLocationController,
                ),

                const SizedBox(height: 20),
                const SectionHeader(title: '📞 Contact Information'),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Your Name',
                  controller: nameController,
                  validator: _required,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Phone Number',
                  controller: phoneController,
                  inputType: TextInputType.phone,
                  validator: _required,
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
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Found item reported')),
                      );
                    }
                  },
                  child: const Text('Submit Found Item'),
                ),
              ],
            ),
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
                  icon: const Icon(Icons.message, color: Colors.green),
                  label: const Text('Message', style: TextStyle(color: Colors.green)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  label: const Text('Call Now'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
