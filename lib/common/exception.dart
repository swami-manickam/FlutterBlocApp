import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';

@freezed
abstract class BlocAppException implements Exception, _$BlocAppException {
  factory BlocAppException.noRecords() = NoRecordsException;
  factory BlocAppException.empty(String message) = EmptyException;
  factory BlocAppException.failedToParse() = FailedToParseException;
}