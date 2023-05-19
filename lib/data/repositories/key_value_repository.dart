import '../model/key_value_models/learn_topic_model.dart';
import '../model/key_value_models/specialty_model.dart';
import '../model/key_value_models/test_preparation_model.dart';

abstract class IKeyValueRepository {
  Future<List<SpecialtyModel>?> getSpecialties();
  Future<List<LearnTopicModel>?> getLearnTopics();
  Future<List<TestPreparationModel>?> getTestPreparations();
}
