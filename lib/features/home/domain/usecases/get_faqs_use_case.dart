import 'package:dartz/dartz.dart';
import 'package:oru_mobiles/core/errors/failures.dart';
import 'package:oru_mobiles/core/usecases/use_case.dart';
import 'package:oru_mobiles/features/home/data/models/faq_model.dart';
import 'package:oru_mobiles/features/home/data/repository/home_repositiry.dart';

class GetFaqsUseCase extends UseCase<List<FaqModel>, NoParams> {
  final HomeRepository homeRepository;

  GetFaqsUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<FaqModel>>> call(NoParams entity) {
    return homeRepository.getFaqs();
  }
}
