import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../domain/plant_request.dart';
import '../../../common/error/failure.dart';
import '../domain/category.dart';
import '../domain/comment.dart';
import '../domain/report.dart';
import '../domain/report_detail.dart';
import '../domain/report_query.dart';

abstract class IReportRepository {
  Future<Either<Failure, List<Plant>>> getPlants({
    required ReportQuery query,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, ReportDetail>> getPlant({
    required int reportId,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Plant>> postPlant(
    PlantRequest report,
    List<File> images,
  );

  Future<Either<Failure, Plant>> updatePlant({
    required int reportId,
    required PlantRequest report,
    required List<File> images,
  });

  Future<Either<Failure, List<Category>>> getCategories({
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Comment>> addComment({
    required int reportId,
    required String comment,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Unit>> deleteComment({
    required int reportId,
    required int commentId,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, List<Comment>>> getComments({
    required int reportId,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Unit>> addLike({
    required int reportId,
    bool isLike = true,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Unit>> removeLike({
    required int reportId,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Unit>> deleteReport({
    required int reportId,
    CancelToken? cancelToken,
  });
}
