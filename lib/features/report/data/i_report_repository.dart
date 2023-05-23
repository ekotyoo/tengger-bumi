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

  Future<Either<Failure, ReportDetail>> getReport({
    required int reportId,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Report>> postReport(
    ReportRequest report,
    List<File> images,
  );

  Future<Either<Failure, Report>> updateReport({
    required int reportId,
    required ReportRequest report,
    required List<File> images,
  });

  Future<Either<Failure, List<Category>>> getCategories({
    required String type,
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
