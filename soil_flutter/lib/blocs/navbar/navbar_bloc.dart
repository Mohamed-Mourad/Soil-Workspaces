import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(const NavbarState()) {
    on<NavbarPageChanged>(_onPageChanged);
  }

  void _onPageChanged(NavbarPageChanged event, Emitter<NavbarState> emit) {
    emit(state.copyWith(selectedIndex: () => event.index));
  }
}
