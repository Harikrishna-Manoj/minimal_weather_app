part of 'animation_bloc.dart';

@immutable
sealed class AnimationState {
  final String assetAnimation;

  const AnimationState({required this.assetAnimation});
}

final class AnimationInitial extends AnimationState {
  const AnimationInitial({required super.assetAnimation});
}
