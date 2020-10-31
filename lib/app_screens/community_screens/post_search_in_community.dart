import 'dart:io';

import 'package:brighter_bee/widgets/post_card_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PostSearchInCommunity extends StatefulWidget {
  final String _community;

  PostSearchInCommunity(this._community);

  @override
  _PostSearchInCommunityState createState() =>
      _PostSearchInCommunityState(_community);
}

class _PostSearchInCommunityState extends State<PostSearchInCommunity> {
  TextEditingController searchController = TextEditingController();
  List memberOf;
  PostListBloc postListBloc;
  ScrollController controller = ScrollController();
  int previousSnapshotLength;
  final String community;

  _PostSearchInCommunityState(this.community);

  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    searchController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (controller.position.extentAfter < 400) {
      debugPrint('At bottom!');
      postListBloc.fetchNextPosts();
    }
  }

  void initState() {
    super.initState();
    previousSnapshotLength = 0;
    postListBloc = PostListBloc(searchController.text.toLowerCase(), community);
    postListBloc.fetchFirstList();
    controller.addListener(scrollListener);
    searchController.addListener(searchBarListener);
  }

  searchBarListener() {
    setState(() {
      postListBloc =
          PostListBloc(searchController.text.toLowerCase(), community);
    });
    postListBloc.fetchFirstList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Theme.of(context).buttonColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: StreamBuilder<List<DocumentSnapshot>>(
            stream: postListBloc.postStream,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                int presentLength = snapshot.data.length;
                return ListView.builder(
                    controller: controller,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot = snapshot.data[index];
                      String id = documentSnapshot.id;
                      debugPrint('${snapshot.data.length}');
                      return Column(
                        children: [
                          PostCardView(
                            documentSnapshot.data()['community'],
                            id,
                            false,
                          ),
                          (index != snapshot.data.length - 1)
                              ? Container()
                              : buildProgressIndicator(presentLength)
                        ],
                      );
                    });
              } else {
                return Container();
              }
            }));
  }

  buildProgressIndicator(int presentLength) {
    if (presentLength != previousSnapshotLength) {
      previousSnapshotLength = presentLength;
      return CircularProgressIndicator();
    } else {
      return Container();
    }
  }
}

class PostListBloc {
  String community;
  String searchText;

  bool showIndicator = false;
  List<DocumentSnapshot> documentList;
  BehaviorSubject<bool> showIndicatorController;
  BehaviorSubject<List<DocumentSnapshot>> postController;

  PostListBloc(this.searchText, this.community) {
    showIndicatorController = BehaviorSubject<bool>();
    postController = BehaviorSubject<List<DocumentSnapshot>>();
  }

  Stream get getShowIndicatorStream => showIndicatorController.stream;

  Stream<List<DocumentSnapshot>> get postStream => postController.stream;

/*This method will automatically fetch first 10 elements from the document list */
  Future fetchFirstList() async {
    if (!showIndicator) {
      try {
        updateIndicator(true);
        documentList = (await getQuery().limit(10).get()).docs;
        postController.sink.add(documentList);
        updateIndicator(false);
      } on SocketException {
        updateIndicator(false);
        postController.sink.addError(SocketException("No Internet Connection"));
      } catch (e) {
        updateIndicator(false);
        print(e.toString());
        postController.sink.addError(e);
      }
    }
  }

/*This will automatically fetch the next 10 elements from the list*/
  fetchNextPosts() async {
    if (!showIndicator) {
      try {
        updateIndicator(true);
        List<DocumentSnapshot> newDocumentList = (await getQuery()
                .startAfterDocument(documentList[documentList.length - 1])
                .limit(10)
                .get())
            .docs;
        documentList.addAll(newDocumentList);
        postController.sink.add(documentList);
        updateIndicator(false);
      } on SocketException {
        postController.sink.addError(SocketException("No Internet Connection"));
      } catch (e) {
        print(e.toString());
        postController.sink.addError(e);
      }
    }
  }

  updateIndicator(bool value) async {
    showIndicator = value;
    showIndicatorController.sink.add(value);
  }

  void dispose() {
    postController.close();
    showIndicatorController.close();
  }

  Query getQuery() {
    return FirebaseFirestore.instance
        .collectionGroup('posts')
        .where('isVerified', isEqualTo: true)
        .where('community', isEqualTo: community)
        .where('titleSearch', arrayContains: searchText.toLowerCase())
        .orderBy('time', descending: true);
  }
}