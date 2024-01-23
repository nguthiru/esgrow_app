import 'package:esgrow/api/search_users.dart';
import 'package:esgrow/components/shimmer_component.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../models/user_search.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  bool shouldReload = false;

  List<UserSearchModel> users = [];

  TextEditingController _accountsSearch = TextEditingController();

  Future<List<UserSearchModel>> getAccounts() async {
    if (shouldReload) {
      try {
        users = await searchUsers(_accountsSearch.text);
      } finally {
        shouldReload = false;
      }
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            addSearchBar(),
            if (_accountsSearch.text.isEmpty)
              showSearchDetails()
            else
              showSearchResults(),
          ],
        ),
      )),
    );
  }

  Widget addSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: _accountsSearch,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: "Search for a user",
            suffixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))),
        onChanged: (value) {
          setState(() {
            shouldReload = true;
          });
        },
      ),
    );
  }

  Widget showSearchDetails() {
    return Flexible(child: Center(child: Text("Hello")));
  }

  Widget showSearchResults() {
    return Flexible(
        child: RefreshIndicator(
      onRefresh: () async {
        shouldReload = true;
        setState(() {});
      },
      child: FutureBuilder(
        future: getAccounts(),
        builder: (BuildContext context,
            AsyncSnapshot<List<UserSearchModel>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done &&
              shouldReload) {
            return const ShimmerComponent(height: 10000);
          }
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView(
              children: [for (var datum in data) showSingleSearchResult(datum)],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error!.toString()));
          } else {
            return const ShimmerComponent(height: 1000);
          }
        },
      ),
    ));
  }

  Widget showSingleSearchResult(UserSearchModel user) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.white.withOpacity(0.1), width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          createAvatar(user),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${user.firstName} ${user.lastName}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                  "@${user.username}",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.5)),
                ),
                Text(
                  "${user.email}",
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget createAvatar(UserSearchModel user) {
    var name = "";
    if (user.firstName.isEmpty && user.lastName.isEmpty) {
      if (user.username.length >= 2) {
        name = user.username.substring(0, 2);
      } else {
        name = user.username;
      }
    } else if (user.firstName.isNotEmpty) {
      if (user.lastName.isNotEmpty) {
        name = user.firstName[0] + user.lastName[0];
      } else {
        if (user.firstName.length >= 2) {
          name = user.firstName.substring(0, 2);
        } else {
          name = user.firstName;
        }
      }
    } else {
      if (user.username.length >= 2) {
        name = user.username.substring(0, 2);
      } else {
        name = user.username;
      }
    }
    return CircleAvatar(
      radius: 28,
      foregroundColor: Colors.white,
      child: Text(
        name,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
