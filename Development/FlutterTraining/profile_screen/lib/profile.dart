import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileScreen'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/asset/nature1.jpg'),
                      // image: NetworkImage(
                      //     'https://www.google.co.in/imgres?imgurl=https%3A%2F%2Fcdn.pixabay.com%2Fphoto%2F2015%2F04%2F23%2F22%2F00%2Ftree-736885__480.jpg&imgrefurl=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&tbnid=L8xfQakH9a8tJM&vet=12ahUKEwi8jKfh5Of0AhVa8zgGHeoYDnQQMygAegUIARDOAQ..i&docid=Ba_eiczVaD9-zM&w=771&h=480&itg=1&q=images&ved=2ahUKEwi8jKfh5Of0AhVa8zgGHeoYDnQQMygAegUIARDOAQ'),
                      fit: BoxFit.cover)),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Container(
                  alignment: const Alignment(0.0, 2.5),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('lib/asset/nature1.jpg'),
                    radius: 60.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
