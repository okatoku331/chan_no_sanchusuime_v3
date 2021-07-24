import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'book.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';
  File imageFile;
  bool isLoading = false;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future showImagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(pickedFile.path);
    print('imageFile$imageFile');
    notifyListeners();
  }

  Future addBookToFirebase() async {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力して下さい');
    }
    final imageURL = await _uploadImage();
    FirebaseFirestore.instance.collection('books').add({
      'title': bookTitle,
      'imageURL': imageURL,
      'createdAT': Timestamp.now(),
    });
  }

  Future updateBook(Book book) async {
    final imageURL = await _uploadImage();
    final document =
        FirebaseFirestore.instance.collection('books').doc(book.documentID);
    await document.update({
      'title': bookTitle,
      'imageURL': imageURL,
      'updatedAT': Timestamp.now(),
    });
  }

  Future<String> _uploadImage() async {
    //TODO: strage へのアップロード
    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot =
        await storage.ref().child(bookTitle).putFile(imageFile);
    final String downloadURL = await snapshot.ref.getDownloadURL();

    return downloadURL;
  }
}
