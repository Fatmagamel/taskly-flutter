import 'package:flutter/material.dart';
import 'package:taskly_fci/home_screen.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
    required this.age,
    required this.email,
    required this.gender,
    required this.password,
    required this.status,
  });

  final String age;
  final String email;
  final String gender;
  final String password;
  final String status;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController _mailController;
  late TextEditingController _ageController;
  late TextEditingController _statusController;
  late TextEditingController _passwordController;
  late TextEditingController _genderController;

  @override
  void initState() {
    super.initState();
    _mailController = TextEditingController(text: widget.email);
    _ageController = TextEditingController(text: widget.age);
    _statusController = TextEditingController(text: widget.status);
    _passwordController = TextEditingController(text: widget.password);
    _genderController = TextEditingController(text: widget.gender);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen(
                            title: 'Home',
                          )));
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary.withAlpha(25),
            Colors.white
          ])),
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 128,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/avatar_place_holder.jpg",
                      width: 256,
                      height: 256,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Card(
                  elevation: 16,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Alex Morgan",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 8,
                        child: ListTile(
                          title: const Text(
                            "Completed Tasks",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text("20",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          tileColor: Theme.of(context).colorScheme.primary,
                          textColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 8,
                        child: ListTile(
                          title: const Text(
                            "Acheived Goals",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text("15",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                          tileColor: Theme.of(context).colorScheme.primary,
                          textColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _mailController,
                  decoration: const InputDecoration(
                      labelText: "Email", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _statusController,
                  decoration: const InputDecoration(
                      labelText: "Status", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                      labelText: "Age", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _genderController,
                  decoration: const InputDecoration(
                      labelText: "Gender", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      labelText: "Password", border: OutlineInputBorder()),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ));
  }
}
