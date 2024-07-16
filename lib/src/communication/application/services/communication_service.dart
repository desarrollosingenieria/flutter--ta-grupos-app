import 'package:tagrupos/core/errors/failures.dart';
import 'package:tagrupos/src/communication/data/repositories/communication_repository_impl.dart';
import 'package:tagrupos/src/communication/domain/entities/voice_parameters.dart';
import 'package:tagrupos/src/communication/domain/repositories/communication_repository.dart';
import 'package:dartz/dartz.dart';

class CommunicationService {
  final CommunicationRepository repository = CommunicationRepositoryImpl();

  Future<Either<Failure, bool>> initVoiceParameters() async {
    return repository.initVoiceParameters();
  }

  Future<Either<Failure, bool>> initLanguages() async {
    return repository.initLanguages();
  }

  Future<Either<Failure, VoiceParameters>> getVoiceParameters() async {
    return repository.getVoiceParameters();
  }

  Future<bool> setVoiceParameters(VoiceParameters parameters) async {
    final result = await repository.setVoiceParameters(parameters);

    return result.fold((l) => throw l, (r) => r);
  }

  Future<Either<Failure, bool>> speak(String text) async {
    return repository.speak(text);
  }

  Future<Either<Failure, bool>> clearVoiceParameters() async {
    return repository.clearVoiceParameters();
  }

  VoiceParameters get voiceParameters => repository.voiceParameters;
}
