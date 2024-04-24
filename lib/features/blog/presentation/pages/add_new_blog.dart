import 'dart:io';

import 'package:blog_app/core/common/utils/pick_image.dart';
import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_editor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});
  static route() =>
      MaterialPageRoute(builder: ((context) => const AddNewBlogPage()));
  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final titleTextEditingController = TextEditingController();
  final contentTextEditingController = TextEditingController();
  List<String> selectedTopic = [];
  File? image;

  void selectImage() async {
    //print('clicked');
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    titleTextEditingController.dispose();
    contentTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              image != null
                  ? GestureDetector(
                      onTap: selectImage,
                      child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: selectImage,
                      child: DottedBorder(
                        color: AppPallete.borderColor,
                        dashPattern: const [10, 4],
                        radius: const Radius.circular(10),
                        borderType: BorderType.RRect,
                        strokeCap: StrokeCap.round,
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.folder_open,
                                size: 40,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Select your image',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: [
                  'Technology',
                  'Business',
                  'Programming',
                  'Entertainment',
                ]
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                if (selectedTopic.contains(e))
                                  selectedTopic.remove(e);
                                else
                                  selectedTopic.add(e);
                                setState(() {});
                              },
                              child: Chip(
                                label: Text(e),
                                color: selectedTopic.contains(e)
                                    ? const MaterialStatePropertyAll(
                                        AppPallete.gradient1)
                                    : null,
                                side: selectedTopic.contains(e)
                                    ? null
                                    : const BorderSide(
                                        color: AppPallete.borderColor,
                                      ),
                              ),
                            ),
                          ),
                        )
                        .toList()),
              ),
              const SizedBox(height: 20),
              BlogEditor(
                textEditingController: titleTextEditingController,
                hintText: 'Blog Title',
              ),
              const SizedBox(height: 20),
              BlogEditor(
                textEditingController: contentTextEditingController,
                hintText: 'Blog Content',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
