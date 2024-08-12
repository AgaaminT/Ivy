import 'package:flutter/material.dart';
import 'package:ivy/ui/posts/posts_screen.dart';
import 'package:ivy/widgets/custom_appbar.dart';
import 'package:ivy/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Social Feed',
        isBackButton: false,
        isSettings: true,
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: const [
          PostWidget(
            username: 'Lavish04.iit',
            avatarUrl:
                'https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D',
            content:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
            likes: 50,
            comments: 10,
            shares: 5,
          ),
          PostWidget(
            username: 'saket09.iit',
            avatarUrl:
                'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHx8MA%3D%3D',
            content:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
            likes: 50,
            comments: 10,
            shares: 5,
          ),
          PostWidget(
            username: 'Kriti.iit',
            avatarUrl:
                'https://images.unsplash.com/photo-1445053023192-8d45cb66099d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D',
            content:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
            likes: 50,
            comments: 10,
            shares: 5,
          ),
          PostWidget(
            username: 'Rishiraj07.iit',
            avatarUrl:
                'https://images.unsplash.com/photo-1526948128573-703ee1aeb6fa?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHx8MA%3D%3D',
            content:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
            likes: 50,
            comments: 10,
            shares: 5,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define the action when the button is pressed
        },
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
