import 'package:autism/features/about/data/model/about_model.dart';
import 'package:autism/features/about/data/repo/about_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_state.dart';
part 'about_cubit.freezed.dart';

class AboutCubit extends Cubit<AboutState> {
  final AboutRepo _aboutRepo;

  AboutCubit(this._aboutRepo) : super(const AboutState.initial());

  void fetchAboutInfo() {
    emit(const AboutState.loading());
    final aboutInfo = _aboutRepo.getAboutInfo();
    emit(AboutState.loaded(aboutInfo));
  }
}
