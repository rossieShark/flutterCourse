import 'package:chopper/chopper.dart';
import '../../services/services.dart';

part 'category_recipe_service.chopper.dart';

@ChopperApi(baseUrl: "https://yummly2.p.rapidapi.com")
abstract class CategoryRecipeService extends ChopperService {
  static CategoryRecipeService create() => _$CategoryRecipeService(
        ChopperClient(
            interceptors: [HeaderInterceptor()],
            converter: $JsonSerializableConverter()),
      );
  @Get(path: '/categories/list/')
  Future<Response<Object>> getApi();
}
