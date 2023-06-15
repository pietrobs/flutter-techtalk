import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lemon/models/CharacterList.dart';
import 'package:lemon/services/rick-and-morty.dart';

class RickAndMorty extends StatefulWidget {
  const RickAndMorty({Key? key}) : super(key: key);

  @override
  _RickAndMortyState createState() => _RickAndMortyState();
}

class _RickAndMortyState extends State<RickAndMorty> {
  final _scrollController = ScrollController();

  CharacterList? list;
  String _searchTerm = "";
  bool _loading = false;
  int _currentPage = 1;
  Timer? _debounce;

  void _searchInitialPage() {
    setState(() {
      _loading = true;
    });
    getCharacter(_searchTerm, 1).then((apiList) {
      setState(() => {
        _loading = false;
        list = apiList;
        _currentPage = 1;
      });
    });
  }

  void _searchNextPage() {
    setState(() {
      _loading = true;
    });
    getCharacter(_searchTerm, _currentPage + 1).then((apiList) {
      setState(() {
        _loading = false;
        list!.total = apiList.total;
        list!.characters.addAll(apiList.characters);
        _currentPage++;
      });
    });
  }

  void _handleClear() {
    setState(() {
      _searchTerm = "";
    });
    _searchInitialPage();
  }

  @override
  void initState() {
    _searchInitialPage();
    super.initState();
  }

  _onSearchChanged(String searchTerm) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _searchTerm = searchTerm;
      });
      _searchInitialPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBar(
              leading: const Icon(Icons.search),
              hintText: "Search",
              onChanged: _onSearchChanged,
            ),
          ),
          Visibility(
            visible: _loading && list == null,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Visibility(
            visible: !_loading,
            child: Text(
              "Mostrando ${list?.characters.length ?? 0} resultados de ${list?.total ?? 0}",
            ),
          ),
          if (list != null)
            Flexible(
              fit: FlexFit.tight,
              child: ListView.separated(
                controller: _scrollController,
                separatorBuilder: (context, index) => const Divider(),
                itemCount: list!.characters.length + 1,
                itemBuilder: (context, index) {
                  if (index == list!.characters.length) {
                    final hasMorePage = list!.characters.length < list!.total;

                    if (!hasMorePage) {
                      return const Center(
                        child: Text("No more results"),
                      );
                    }

                    return Center(
                      child: _loading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _searchNextPage,
                              child: const Text("Load more"),
                            ),
                    );
                  }

                  return Column(children: [
                    Image.network(list!.characters[index].image),
                    const SizedBox(height: 8),
                    Text(
                      list!.characters[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("Espécie: ${list!.characters[index].species}"),
                    const SizedBox(height: 8),
                    Text("Status: ${list!.characters[index].status}"),
                  ]);
                },
              ),
            )
        ],
      ),
    );
  }
}
