import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _name;
  late String _lastName;
  late String _id;
  late String _contactNumber;
  late Image _image;
  late String _address;
  late String _gender;

  @override
  void initState() {
    super.initState();
    _name = 'Alish';
    _lastName = 'Ghemosu';
    _id = '12345';
    _contactNumber = '123-456-7890';
    _image = Image.asset(
      'assets/images/cartoon.jpeg',
      height: 250,
    );
    _address = 'Suryabinayak, BKT';
    _gender = 'Male';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: _image,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'NAME: $_name $_lastName',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: Text(
                      'ID: $_id',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'CONTACT NUM: $_contactNumber',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: Text(
                      ' ADDRESS: $_address',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'GENDER: $_gender',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Center(child: Image.asset('assets/images/qr.png'))
            ],
          ),
        ),
      ),
    );
  }
}
