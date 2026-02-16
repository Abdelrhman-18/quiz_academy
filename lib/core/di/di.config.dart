// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/auth_datasource.dart' as _i495;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/exam/data/datasources/save_exam_result_datasource.dart'
    as _i22;
import '../../features/exam/data/repositories/save_exam_result_repository_impl.dart'
    as _i354;
import '../../features/exam/domain/repositories/save_exam_result_repository.dart'
    as _i616;
import '../../features/exam/domain/usecases/save_exam_result_usecase.dart'
    as _i815;
import '../../features/exam/presentation/cubit/exam_cubit.dart' as _i622;
import '../../features/results_history/data/datasources/get_result_history_datasource.dart'
    as _i270;
import '../../features/results_history/data/repositories/get_result_history_repository_impl.dart'
    as _i650;
import '../../features/results_history/domain/repositories/get_result_history_repository.dart'
    as _i744;
import '../../features/results_history/domain/usecases/get_result_history_usecase.dart'
    as _i9;
import '../../features/results_history/presentation/cubit/results_history_cubit.dart'
    as _i505;
import '../database/data_base_helper.dart' as _i45;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i45.DatabaseHelper>(() => _i45.DatabaseHelper());
    gh.lazySingleton<_i22.SaveExamResultDataSource>(
      () => _i22.SaveExamResultDataSourceImpl(gh<_i45.DatabaseHelper>()),
    );
    gh.lazySingleton<_i495.AuthDataSource>(
      () => _i495.AuthDatasourceImpl(gh<_i45.DatabaseHelper>()),
    );
    gh.lazySingleton<_i270.GetResultHistoryDatasource>(
      () => _i270.GetResultHistoryDatasourceImpl(gh<_i45.DatabaseHelper>()),
    );
    gh.factory<_i744.GetResultHistoryRepository>(
      () => _i650.GetResultHistoryRepositoryImpl(
        gh<_i270.GetResultHistoryDatasource>(),
      ),
    );
    gh.factory<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i495.AuthDataSource>()),
    );
    gh.factory<_i188.LoginUsecase>(
      () => _i188.LoginUsecase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i941.RegisterUsecase>(
      () => _i941.RegisterUsecase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i616.SaveExamResultRepository>(
      () => _i354.SaveExamResultRepositoryImpl(
        gh<_i22.SaveExamResultDataSource>(),
      ),
    );
    gh.factory<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        gh<_i188.LoginUsecase>(),
        gh<_i941.RegisterUsecase>(),
      ),
    );
    gh.factory<_i9.GetResultHistoryUsecase>(
      () => _i9.GetResultHistoryUsecase(gh<_i744.GetResultHistoryRepository>()),
    );
    gh.factory<_i815.SaveExamResultUseCase>(
      () => _i815.SaveExamResultUseCase(gh<_i616.SaveExamResultRepository>()),
    );
    gh.factory<_i505.ResultsHistoryCubit>(
      () => _i505.ResultsHistoryCubit(gh<_i9.GetResultHistoryUsecase>()),
    );
    gh.factory<_i622.ExamCubit>(
      () => _i622.ExamCubit(gh<_i815.SaveExamResultUseCase>()),
    );
    return this;
  }
}
