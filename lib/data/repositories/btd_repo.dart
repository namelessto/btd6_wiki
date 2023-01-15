import 'dart:convert';

import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:btd6_wiki/data/models/boss.dart';
import 'package:btd6_wiki/data/models/hero_tower.dart';
import 'package:btd6_wiki/data/models/tower.dart';
import 'package:btd6_wiki/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BTDRepo {
  BTDRepo();
  // --- Monkeys ---
  Future<List<String>> fetchTowersIDS() async {
    final response = await http.get(Uri.parse('$baseAllTowersUrl?id=true'));
    if (response.statusCode == 200) {
      List<dynamic> jsonItems = jsonDecode(response.body);
      List<String> towersIDS;
      towersIDS = jsonItems.map((item) => item['id'].toString()).toList();
      return towersIDS;
    } else {
      throw Exception('Failed to load tower');
    }
  }

  Future<Tower> fetchTower(String id) async {
    final response = await http.get(Uri.parse('$baseTowerUrl/$id'));
    if (response.statusCode == 200) {
      return Tower.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tower');
    }
  }

  Future<List<Tower>> fetchTowers() async {
    final response = await http.get(Uri.parse(baseAllTowersUrl));
    if (response.statusCode == 200) {
      List<Tower> towers;
      towers = (jsonDecode(response.body) as List)
          .map((i) => Tower.fromJson(i))
          .toList();
      return towers;
    } else {
      throw Exception('Failed to load tower');
    }
  }

  Future<List<Tower>> fetchTowersFromType(String type) async {
    final response = await http.get(Uri.parse(baseAllTowersUrl));
    if (response.statusCode == 200) {
      List<Tower> towers;
      towers = (jsonDecode(response.body) as List)
          .map((i) => Tower.fromJson(i))
          .where((tower) => tower.type == type)
          .toList();
      return towers;
    } else {
      throw Exception('Failed to load tower');
    }
  }

  List<NetworkImage> fetchBaseTowersImages(List<String> ids) {
    return ids
        .map((id) => NetworkImage('$baseTowerImageUrl/$id/tower.png'))
        .toList();
  }

  NetworkImage fetchTowerImage(String id) {
    return NetworkImage(
      '$baseTowerImageUrl/$id/tower.png',
    );
  }

  NetworkImage fetchTowerPathImage(String id, String pathId) {
    return NetworkImage(
      '$baseTowerImageUrl/$id/$pathId.png',
    );
  }

  List<NetworkImage> fetchTowerPathsImages(String id) {
    List list = List.from(Iterable.generate(5, (i) {
      return [
        NetworkImage('$baseTowerImageUrl/$id/${i + 1}00.png'),
        NetworkImage('$baseTowerImageUrl/$id/0${i + 1}0.png'),
        NetworkImage('$baseTowerImageUrl/$id/00${i + 1}.png'),
      ];
    })).expand((element) => element).toList();

    return list.cast<NetworkImage>();
  }

  // --- Heroes ---
  Future<List<String>> fetchHeroesIDS() async {
    final response = await http.get(Uri.parse('$baseAllHeroesUrl?id=true'));
    if (response.statusCode == 200) {
      List<dynamic> jsonItems = jsonDecode(response.body);
      List<String> towersIDS;
      towersIDS = jsonItems.map((item) => item['id'].toString()).toList();
      return towersIDS;
    } else {
      throw Exception('Failed to load tower');
    }
  }

  Future<HeroTower> fetchHero(String id) async {
    final response = await http.get(Uri.parse('$baseHeroUrl/$id'));
    if (response.statusCode == 200) {
      return HeroTower.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load hero');
    }
  }

  Future<List<HeroTower>> fetchHeroes() async {
    final response = await http.get(Uri.parse(baseAllHeroesUrl));
    if (response.statusCode == 200) {
      List<HeroTower> heroes;
      heroes = (jsonDecode(response.body) as List)
          .map((i) => HeroTower.fromJson(i))
          .toList();
      return heroes;
    } else {
      throw Exception('Failed to load tower');
    }
  }

  List<NetworkImage> fetchBaseHeroesImages(List<String> ids) {
    return ids
        .map((id) => NetworkImage('$baseHeroImageUrl/$id/hero.png'))
        .toList();
  }

  NetworkImage fetchHeroImage(String id) {
    return NetworkImage('$baseHeroImageUrl/$id/hero.png');
  }

  NetworkImage fetchHeroBaseSkinImage(String id, String skinId) {
    return NetworkImage('$baseHeroImageUrl/$id/$skinId/hero.png');
  }

  List<NetworkImage> fetchHeroBaseSkinsImages(String id, List<String> skinIds) {
    return skinIds
        .map((skinId) => NetworkImage('$baseHeroImageUrl/$id/$skinId/hero.png'))
        .toList();
  }

  List<NetworkImage> fetchHeroLevelImages(String id, List<int> levels) {
    return levels
        .map((level) => NetworkImage('$baseHeroImageUrl/$id/$level.png'))
        .toList();
  }

  List<NetworkImage> fetchHeroSkinLevelImages(
      String id, String skinId, List<int> levels) {
    return levels.map((level) {
      return NetworkImage('$baseHeroImageUrl/$id/$skinId/$level.png');
    }).toList();
  }

  List<List<NetworkImage>> fetchHeroSkinsLevelImages(
      String id, List<String> skinIds, List<int> levels) {
    return skinIds.map((skinId) {
      return levels.map((level) {
        return NetworkImage('$baseHeroImageUrl/$id/$skinId/$level.png');
      }).toList();
    }).toList();
  }

  // --- Bloons ---
  Future<Bloon> fetchBloon(String id) async {
    final response = await http.get(Uri.parse('$baseBloonUrl/$id'));
    if (response.statusCode == 200) {
      return Bloon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tower');
    }
  }

  NetworkImage fetchBloonImage(String id) {
    return NetworkImage('$baseBloonImageUrl/$id/base.png');
  }

  Future<List<Bloon>> fetchSpecificBloons(List<String> ids) async {
    final response = await http.get(Uri.parse(baseAllBloonsUrl));
    if (response.statusCode == 200) {
      List items = jsonDecode(response.body) as List;
      List<Bloon> bloons;
      items = items = items.where((item) => ids.contains(item['id'])).toList();
      bloons = items.map((e) => Bloon.fromJson(e)).toList();
      return bloons;
    } else {
      throw Exception('Failed to load tower');
    }
  }

  Future<List<Bloon>> fetchAllBloons() async {
    final response = await http.get(Uri.parse(baseAllBloonsUrl));
    if (response.statusCode == 200) {
      List items = jsonDecode(response.body) as List;
      List<Bloon> bloons;

      items = items.where((item) => item['type'] != 'boss').toList();
      bloons = items.map((e) => Bloon.fromJson(e)).toList();
      return bloons;
    } else {
      throw Exception('Failed to load tower');
    }
  }

  Future<List<Boss>> fetchBloonsBosses() async {
    final response = await http.get(Uri.parse(baseAllBloonsUrl));
    if (response.statusCode == 200) {
      List items = jsonDecode(response.body) as List;
      List<Boss> bosses;

      items = items.where((item) => item['type'] == 'boss').toList();

      bosses = items.map((e) => Boss.fromJson(e)).toList();
      return bosses;
    } else {
      throw Exception('Failed to load tower');
    }
  }

  List<NetworkImage> fetchBloonsImages(List<String> ids) {
    return ids
        .map((id) => NetworkImage('$baseBloonImageUrl/$id/base.png'))
        .toList();
  }

  List<NetworkImage> fetchBloonVariantsImages(
      String id, List<String> variants) {
    return variants
        .map((variant) => NetworkImage('$baseBloonImageUrl/$id/$variant.png'))
        .toList();
  }
}
