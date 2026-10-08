import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Biodata App',
theme: ThemeData(primarySwatch: Colors.blue),
home: const LoginPage(),
);
}
}

// ---------------- LOGIN PAGE ----------------
class LoginPage extends StatefulWidget {
const LoginPage({super.key});

@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final usernameController = TextEditingController();
final passwordController = TextEditingController();

void login() {
// Simple lang: hardcoded na username at password
if (usernameController.text == 'admin' &&
passwordController.text == '1234') {
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (context) => const BiodataPage()),
);
} else {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Mali ang username o password!')),
);
}
}

@override
void dispose() {
usernameController.dispose();
passwordController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Log In')),
body: Padding(
padding: const EdgeInsets.all(20),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Icon(Icons.account_circle, size: 100, color: Colors.blue),
const SizedBox(height: 20),
TextField(
controller: usernameController,
decoration: const InputDecoration(
labelText: 'Username',
border: OutlineInputBorder(),
),
),
const SizedBox(height: 15),
TextField(
controller: passwordController,
obscureText: true,
decoration: const InputDecoration(
labelText: 'Password',
border: OutlineInputBorder(),
),
),
const SizedBox(height: 20),
SizedBox(
width: double.infinity,
child: ElevatedButton(
onPressed: login,
child: const Text('Log In'),
),
),
],
),
),
);
}
}

// ---------------- BIODATA PAGE ----------------
class BiodataPage extends StatelessWidget {
const BiodataPage({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Biodata'),
actions: [
IconButton(
icon: const Icon(Icons.logout),
onPressed: () {
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (context) => const LoginPage()),
);
},
),
],
),
body: ListView(
padding: const EdgeInsets.all(20),
children: const [
Center(
child: CircleAvatar(
radius: 50,
child: Icon(Icons.person, size: 60),
),
),
SizedBox(height: 20),
Card(
child: ListTile(
leading: Icon(Icons.person),
title: Text('Pangalan'),
subtitle: Text('Juan Dela Cruz'),
),
),
Card(
child: ListTile(
leading: Icon(Icons.cake),
title: Text('Edad'),
subtitle: Text('20'),
),
),
Card(
child: ListTile(
leading: Icon(Icons.home),
title: Text('Address'),
subtitle: Text('Caloocan City'),
),
),
Card(
child: ListTile(
leading: Icon(Icons.email),
title: Text('Email'),
subtitle: Text('juan@email.com'),
),
),
Card(
child: ListTile(
leading: Icon(Icons.school),
title: Text('Kurso'),
subtitle: Text('BS Information Technology'),
),
),
],
),
);
}
}