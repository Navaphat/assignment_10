import 'package:flutter/material.dart';

class model {
  var _user;
  var _userImage;
  var _postImage;
  var _postMessage;
  bool _liked = false;
  List<Map<String, String>> _comment = [];

  TextEditingController _controller  = TextEditingController();


  model(var user, var userImage, var postImage, var postMessage, List<Map<String, String>> comment) {
    this._user = user;
    this._userImage = userImage;
    this._postImage = postImage;
    this._postMessage = postMessage;
    this._comment = comment;
  }

  getUser() {
    return _user;
  }

  getUserImage() {
    return _userImage;
  }

  getPostImage() {
    return _postImage;
  }

  getPostMessage() {
    return _postMessage;
  }

  getLiked() {
    return _liked;
  }

  pressLike() {
    _liked = !_liked;
  }

  getController() {
    return _controller;
  }

  getCommentUser({int? i}) {
    return _comment[i!]['username'];
  }

  getComment({int? i}) {
    return _comment[i!]['comment'];
  }

  addComment({String? comment, String? userName}) {
    _comment.add({'username': userName!, 'comment': comment!});
  }

  getCommentLength() {
    return _comment.length;
  }
}