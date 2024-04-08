import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forwardious/backend/bloc/cubit/invidious_instance_cubit.dart';

class SelectInstanceRadioButtonCubit extends Cubit<String> {

  final InvidiousInstanceCubit invCubit;

  SelectInstanceRadioButtonCubit(this.invCubit) : super('');

  ///Change the state of radio button to rebuild the widget.
  void selectOption(String value) {
    emit(value);
  }
}
