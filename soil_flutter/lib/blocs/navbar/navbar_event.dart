part of 'navbar_bloc.dart';

sealed class NavbarEvent extends Equatable {
  const NavbarEvent();

  @override
  List<Object?> get props => [];
}

final class NavbarPageChanged extends NavbarEvent {
  const NavbarPageChanged({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}
