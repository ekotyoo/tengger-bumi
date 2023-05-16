import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../domain/report_request.dart';
import '../../../common/error/failure.dart';
import '../domain/category.dart';
import '../domain/comment.dart';
import '../domain/report.dart';
import '../domain/report_detail.dart';
import '../domain/report_query.dart';

abstract class IReportRepository {
  Future<Either<Failure, List<Report>>> getReports({
    required ReportQuery query,
    CancelToken? cancelToken,
  });

  Future<ReportDetail> getReport({
    required String reportId,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Unit>> postReport(
      ReportRequest report, List<File> images);

  Future<Either<Failure, List<Category>>> getCategories({
    required String type,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Comment>> addComment({
    required String reportId,
    required String comment,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Unit>> addLike({
    required String reportId,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Unit>> removeLike({
    required String reportId,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Unit>> addDislike({
    required String reportId,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Unit>> removeDislike({
    required String reportId,
    CancelToken? cancelToken,
  });
}
