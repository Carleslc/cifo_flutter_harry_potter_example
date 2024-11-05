import 'package:flutter/material.dart';

import '../models/character.dart';
import '../utils/responsive.dart';
import 'character_detail.dart';
import 'character_list.dart';
import 'character_list_wide.dart';

class ResponsiveCharacterList extends StatefulWidget {
  const ResponsiveCharacterList({super.key});

  @override
  State<ResponsiveCharacterList> createState() =>
      _ResponsiveCharacterListState();
}

class _ResponsiveCharacterListState extends State<ResponsiveCharacterList> {
  Character? _selectedCharacterDetails;

  void _navigateToCharacterDetails(Character character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetail(character: character),
      ),
    ).then((_) {
      _selectedCharacterDetails = null; // on close (back from CharacterDetail)
    });
  }

  CharacterListWide _wideCharacterList() {
    return CharacterListWide(
      onCharacterSelected: (Character selectedCharacter) {
        _selectedCharacterDetails = selectedCharacter;
      },
    );
  }

  CharacterList _characterList() {
    if (_selectedCharacterDetails != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navigateToCharacterDetails(_selectedCharacterDetails!);
      });
    }
    return CharacterList(onCharacterSelected: (Character selectedCharacter) {
      _selectedCharacterDetails = _selectedCharacterDetails;
      _navigateToCharacterDetails(selectedCharacter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => isLarge(constraints.maxWidth)
          ? _wideCharacterList()
          : _characterList(),
    );
  }
}
