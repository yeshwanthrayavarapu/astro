import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:life_pattern/features/bonds/application/bond_providers.dart';
import 'package:life_pattern/features/birth_profile/presentation/widgets/analyzing_loader.dart';

class CreateBondScreen extends ConsumerStatefulWidget {
  const CreateBondScreen({super.key});

  @override
  ConsumerState<CreateBondScreen> createState() => _CreateBondScreenState();
}

class _CreateBondScreenState extends ConsumerState<CreateBondScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  DateTime? _dob;

  // For now, MVP assumes offline profile creation only
  // Future: Add toggle for In-App Search

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _dob == null) {
      if (_dob == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a birth date')),
        );
      }
      return;
    }

    try {
      final bondId = await ref
          .read(createBondControllerProvider.notifier)
          .createWithOfflineProfile(
            name: _nameController.text.trim(),
            dob: _dob!,
          );

      if (mounted) {
        context.pushReplacement('/bonds/detail/$bondId');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating bond: $e')),
        );
      }
    }
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() => _dob = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createBondControllerProvider);
    final isLoading = state.isLoading;

    if (isLoading) {
      return const AnalyzingLoader(message: 'Analyzing Compatibility...');
    }

    return Scaffold(
      appBar: AppBar(title: const Text('New Connection')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Who would you like to bond with?',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                'Enter their details to uncover your compatibility.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),

              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),

              // Date Picker
              InkWell(
                onTap: _pickDate,
                borderRadius: BorderRadius.circular(4),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.cake_outlined),
                  ),
                  child: Text(
                    _dob == null
                        ? 'Select Date'
                        : '${_dob!.day}/${_dob!.month}/${_dob!.year}',
                    style: _dob == null
                        ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).hintColor,
                            )
                        : Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _submit,
                  icon: const Icon(Icons.auto_awesome),
                  label: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Analyze Compatibility'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
