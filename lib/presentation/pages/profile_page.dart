// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print

import 'dart:io';
import 'package:cryptoapp/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? _coverImage;
  XFile? _profileImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _postController = TextEditingController();
  var parser = EmojiParser();

  Future<void> _pickImage(ImageSource source, bool isCover) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        if (isCover) {
          _coverImage = image;
        } else {
          _profileImage = image;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            // Voltar para a página HomePage
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCoverImage(),
            const SizedBox(height: 8),
            _buildProfileImage(),
            _buildProfileDetails(),
            _postModalButton(),
            _buildTabs(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPostModal,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.edit_note),
      ),
    );
  }

  Widget _buildCoverImage() => GestureDetector(
        onTap: () => _pickImage(ImageSource.gallery, true),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: _coverImage == null ? Colors.grey[200] : null,
            image: _coverImage != null
                ? DecorationImage(
                    image: FileImage(File(_coverImage!.path)),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: _coverImage == null
              ? const Icon(Icons.camera_alt, color: Colors.blue, size: 50)
              : null,
        ),
      );

  Widget _buildProfileImage() => GestureDetector(
        onTap: () => _pickImage(ImageSource.gallery, false),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.lightBlue[100],
          backgroundImage: _profileImage != null
              ? FileImage(File(_profileImage!.path))
              : null,
          child: _profileImage == null
              ? const Icon(Icons.person, size: 40, color: Colors.white)
              : null,
        ),
      );

  Widget _buildProfileDetails() => const Column(
        children: [
          Text('emerson_tecno',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text('@emerson_tecno'),
          Text('Joined 2018 February'),
        ],
      );

  Widget _postModalButton() => ElevatedButton(
        onPressed: _showPostModal,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        child: const Text('Add Post'),
      );
  Widget _buildTabs() => DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Theme(
              data: ThemeData(
                // Defina o esquema de cores para o tab bar
                primaryColor: Colors.blue,
                highlightColor: Colors.lightBlue[50],
                splashColor: Colors.lightBlue[50],
              ),
              child: const TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Posts'),
                  Tab(text: 'Comentários'),
                  Tab(text: 'Reações'),
                ],
              ),
            ),
            const SizedBox(
              height: 300,
              child: TabBarView(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 50),
                        Text(
                            'Você pode postar seu primeiro post ou descobrir e seguir contas nas quais está interessado!'),
                        TextButton(
                          onPressed: null,
                          child: Text('Criar post',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  ),
                  Center(child: Text('Ainda não há comentários')),
                  Center(child: Text('Nenhuma reação ainda')),
                ],
              ),
            ),
          ],
        ),
      );

  void _showPostModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.6,
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, size: 24),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                TextField(
                  controller: _postController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText:
                        "Como você se sente em relação aos mercados hoje?",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.emoji_emotions, size: 24),
                      onPressed: _selectEmoji,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("Post content: ${_postController.text}");
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      child: const Text("Post"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _selectEmoji() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Selecione Emoji'),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.face)),
                  Tab(icon: Icon(Icons.pets)),
                  Tab(icon: Icon(Icons.fastfood)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _emojiGrid(
                    [':smiley:', ':laughing:', ':blush:', ':heart_eyes:']),
                _emojiGrid([':cat:', ':dog:', ':mouse:', ':hamster:']),
                _emojiGrid([':pizza:', ':hamburger:', ':cake:', ':beer:']),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _emojiGrid(List<String> emojis) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: emojis.length,
      itemBuilder: (context, index) {
        var emoji = parser.emojify(emojis[index]);
        return GestureDetector(
          onTap: () {
            setState(() {
              _postController.text += emoji;
            });
            Navigator.pop(context);
          },
          child:
              Center(child: Text(emoji, style: const TextStyle(fontSize: 24))),
        );
      },
    );
  }
}
