import 'package:flutter/material.dart';

class CreateFormViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController dateControllerStart = TextEditingController();
  final TextEditingController dateControllerEnd = TextEditingController();

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  CreateFormViewModel() {
    _addListeners();
  }

  void _addListeners() {
    nameController.addListener(_validateForm);
    budgetController.addListener(_validateForm);
    dateControllerStart.addListener(_validateForm);
    dateControllerEnd.addListener(_validateForm);
  }

  void _validateForm() {
    _isFormValid = nameController.text.isNotEmpty &&
        budgetController.text.isNotEmpty &&
        dateControllerStart.text.isNotEmpty &&
        dateControllerEnd.text.isNotEmpty;

    notifyListeners(); // Notifies the view (UI) about state changes
  }

  @override
  void dispose() {
    nameController.dispose();
    budgetController.dispose();
    dateControllerStart.dispose();
    dateControllerEnd.dispose();
    super.dispose();
  }
}
 
/*

class CreateFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateFormViewModel>(
      create: (_) => CreateFormViewModel(),
      child: Scaffold(
        appBar: AppBar(title: Text("Create Form")),
        body: Consumer<CreateFormViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: viewModel.nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: viewModel.budgetController,
                    decoration: InputDecoration(labelText: 'Budget'),
                  ),
                  TextField(
                    controller: viewModel.dateControllerStart,
                    decoration: InputDecoration(labelText: 'Start Date'),
                  ),
                  TextField(
                    controller: viewModel.dateControllerEnd,
                    decoration: InputDecoration(labelText: 'End Date'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: viewModel.isFormValid
                        ? () => _onCreateButtonPressed(context, viewModel)
                        : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48),
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Create",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onCreateButtonPressed(BuildContext context, CreateFormViewModel viewModel) {
    // Handle the form submission

  }
}
*/
