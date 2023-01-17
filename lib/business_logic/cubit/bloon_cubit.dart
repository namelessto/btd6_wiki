import 'package:bloc/bloc.dart';
import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:btd6_wiki/data/repositories/btd_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bloon_state.dart';

class BloonCubit extends Cubit<BloonState> {
  BloonCubit({required this.btdRepo}) : super(BloonInitialState());

  bool _dataFetched = false;
  String _id = '';

  final BTDRepo btdRepo;

  void setBloonFromAPI(String id) async {
    try {
      if (!_dataFetched || _id != id) {
        emit(BloonLoadingState());
        final bloon = await btdRepo.fetchBloon(id);
        List<NetworkImage> bloonImages = [];

        bloonImages.add(btdRepo.fetchBloonImage(bloon.id));

        if (bloon.variants.isNotEmpty) {
          bloonImages.addAll(
              btdRepo.fetchBloonVariantsImages(bloon.id, bloon.variants));
        }

        List<Bloon> children = [];
        List<NetworkImage> childrenImages = [];

        if (bloon.children.isNotEmpty) {
          List<String> ids = [];
          ids = bloon.children.map((child) => child.id).toList();
          children = await btdRepo.fetchSpecificBloons(ids);
          childrenImages = btdRepo.fetchBloonsImages(ids);
        }
        List<Bloon> parents = [];
        List<NetworkImage> parentsImages = [];

        if (bloon.parents.isNotEmpty) {
          List<String> ids = [];
          ids = bloon.parents.map((parent) => parent.id).toList();
          parents = await btdRepo.fetchSpecificBloons(ids);
          ids = parents.map((parent) => parent.id).toList();
          parentsImages = btdRepo.fetchBloonsImages(ids);
        }

        emit(BloonLoadedState(
          bloon,
          bloonImages,
          children,
          childrenImages,
          parents,
          parentsImages,
        ));
        _dataFetched = true;
        _id = bloon.id;
      }
    } catch (e) {
      emit(BloonErrorState());
    }
  }

  void setBloonBloonsStatePlusApi(
    List<Bloon> bloons,
    List<NetworkImage> bloonsImages,
    int index,
  ) {
    try {
      if (bloons.isNotEmpty) {
        final bloon = bloons.elementAt(index);
        List<NetworkImage> bloonImages = [];

        bloonImages.add(bloonsImages.elementAt(index));

        if (bloon.variants.isNotEmpty) {
          bloonImages.addAll(
              btdRepo.fetchBloonVariantsImages(bloon.id, bloon.variants));
        }

        //List<Bloon> children = [];
        //List<NetworkImage> childrenImages = [];
        //TODO implement children
        if (bloon.children.isNotEmpty) {}

        //List<Bloon> parents = [];
        //List<NetworkImage> parentsImages = [];
        //TODO implement parents
        if (bloon.parents.isNotEmpty) {}
      }
    } on Exception catch (e) {
      // TODO add error page
    }
  }
}
