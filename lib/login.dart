import 'package:flutter/material.dart';
import 'package:taskly_fci/home.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String gender = "Option 1";
  String? Status;
  double Age=50;
  bool isSwitched = false;
  bool  isAccepted =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),

        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtIr5WW7vtFBwAUwptaRNkOThkxKXZEfjbAA&s"),
                  height: 70,
                  width: 50,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your Company Name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Password TextField
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
// Gender Radio Buttons
                Row(
                    mainAxisAlignment: MainAxisAlignment.start, children: [
                  const Text('Gender:'),
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      Radio(
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      const Text('Male'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      const Text('Female'),
                    ],
                  ),
                ]
                ),

                const SizedBox(width: 16),
                // Status Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Single', child: Text('Single')),
                    DropdownMenuItem(value: 'Married', child: Text('Married')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      Status= value;
                    });
                  },
                  hint: const Text('Status'),
                ),
                const SizedBox(height: 16),
                // Age Slider
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Age+${ Age.toStringAsFixed(0)}"),
                    Slider(
                      value: Age,
                      onChanged: (value) {
                        setState(() {
                          Age = value;
                        });
                      },

                      min: 0,
                      max: 100,
                      label: '${Age.toStringAsFixed(1)}',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Receive Notifications Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Receive Notifications',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched=value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Terms and Conditions Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: isAccepted,
                      onChanged: (value) {
                        setState(() {
                          isAccepted=value!;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text('I agree to the Terms and Conditions',
                        style: TextStyle(fontSize: 16),),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Notes TextField
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Notes',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => const  LoginScreen())
                      );
                    },
                    child: const Text('Sign Up'),
                  ),
                ),




              ]),
        ),
      ),










    );
  }
}
