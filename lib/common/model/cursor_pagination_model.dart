import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination_model.g.dart';

abstract class CursorPaginationBase {}

// 에러
class CursorPaginationError extends CursorPaginationBase {
  final String message;

  CursorPaginationError({
    required this.message,
  });
}

// 로딩중
class CursorPaginationLoading extends CursorPaginationBase {}

/// 페이지네이션 클래스: data 부분에 다양한 클래스가 들어오기 때문에 <T>라는 제너릭을 넣어서 관리
@JsonSerializable(
  genericArgumentFactories: true,
)
class CursorPagination<T> extends CursorPaginationBase {
  final CursorPaginationMeta meta;
  final List<T> data;

  CursorPagination({
    required this.meta,
    required this.data,
  });

  CursorPagination copyWith({
    CursorPaginationMeta? meta,
    List<T>? data,
  }) {
    return CursorPagination(
      meta: meta ?? this.meta,
      data: data ?? this.data,
    );
  }

  factory CursorPagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CursorPaginationFromJson(json, fromJsonT);
}

@JsonSerializable()
class CursorPaginationMeta {
  final int count;
  final bool hasMore;

  CursorPaginationMeta({
    required this.count,
    required this.hasMore,
  });

  CursorPaginationMeta copyWith({
    int? count,
    bool? hasMore,
  }) {
    return CursorPaginationMeta(
      count: count ?? this.count,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  factory CursorPaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$CursorPaginationMetaFromJson(json);
}

// 새로고침을 할때
class CursorPaginationRefetching extends CursorPagination {
  CursorPaginationRefetching({
    required super.meta,
    required super.data,
  });
}

// 리스트의 맨 아래로 내려서
// 추가 데이터를 요청하는 중
class CursorPaginationFetchingMore extends CursorPagination {
  CursorPaginationFetchingMore({
    required super.meta,
    required super.data,
  });
}
