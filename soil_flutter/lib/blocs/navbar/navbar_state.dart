part of 'navbar_bloc.dart';

final class NavbarState extends Equatable {
  const NavbarState({this.selectedIndex = 0});

  final int selectedIndex;

  NavbarState copyWith({
    int Function()? selectedIndex,
  }) {
    return NavbarState(
      selectedIndex: selectedIndex != null ? selectedIndex() : this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [selectedIndex];
}
