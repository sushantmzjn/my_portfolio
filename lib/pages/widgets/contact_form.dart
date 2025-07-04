import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/custom_text_field.dart';
import 'package:portfolio/core/text_styles.dart';
import 'package:portfolio/pages/widgets/custom_outlined_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // EmailJS Configuration - Replace with your actual values
  static const String _serviceId = 'service_1xwv12x';
  static const String _templateId = 'template_9n05vsr';
  static const String _publicKey = 'hH7gujyRajDrmkwFD';
  static const String _yourEmail = 'sushantmaharjan08@example.com';

  final Dio _dio = Dio();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _messageController.dispose();
    _dio.close();
    super.dispose();
  }

  Future<void> _sendEmailViaEmailJSFormData() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final response = await _dio.post(
        'https://api.emailjs.com/api/v1.0/email/send-form',
        data: {
          'service_id': _serviceId,
          'template_id': _templateId,
          'user_id': _publicKey,
          'template_params': {
            'name': _nameController.text,
            'email': _emailController.text,
            'phone': _phoneController.text,
            'address': _addressController.text,
            'message': _messageController.text,
            'time': DateTime.now().toString(),
            'to_email': _yourEmail,
            'reply_to': _emailController.text,
          },
        },
      );

      if (response.statusCode == 200) {
        _showSuccessDialog();
        _clearForm();
      } else {
        _showErrorDialog('Failed to send email. Please try again.');
      }
    } on DioException catch (e) {
      String errorMessage = 'Network error. Please check your connection.';

      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection timeout. Please try again.';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Server response timeout. Please try again.';
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = 'No internet connection. Please check your network.';
      } else if (e.response?.statusCode == 400) {
        errorMessage =
            'Invalid request. Please check your EmailJS configuration.';
      } else if (e.response?.statusCode == 403) {
        errorMessage = 'EmailJS service limit reached or invalid credentials.';
      }

      _showErrorDialog(errorMessage);
    } catch (e) {
      _showErrorDialog('Unexpected error occurred. Please try again.');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _addressController.clear();
    _messageController.clear();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.grey[900],
            title: const Text(
              'Success!',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Your message has been sent successfully! I will get back to you soon.',
              style: TextStyle(color: Colors.white70),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK', style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.grey[900],
            title: const Text('Error', style: TextStyle(color: Colors.white)),
            content: Text(
              message,
              style: const TextStyle(color: Colors.white70),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Contact Form',
            style: TextStyles.boldTextStyle.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: 'Name',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomTextField(
                  hintText: 'Your Email',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: 'Your Phone',
                  controller: _phoneController,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomTextField(
                  hintText: 'Address',
                  controller: _addressController,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          CustomTextField(
            hintText: 'Your Message',
            maxLines: 6,
            vertical: 10,
            controller: _messageController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          SizedBox(height: 35),
          CustomOutlinedButton(
            label: _isLoading ? 'SENDING...' : 'SEND MESSAGE',
            onPressed: _isLoading ? null : _sendEmailViaEmailJSFormData,
          ),
        ],
      ),
    );
  }
}
