part of 'blog_bloc.dart';

@immutable
sealed class BlogState {
  const BlogState();
}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogUploadSuccess extends BlogState {}

final class BlogsDisplaySuccess extends BlogState {
  final List<Blog> blogs;
  const BlogsDisplaySuccess(this.blogs);
}

final class BlogFailure extends BlogState {
  final String error;

  const BlogFailure(this.error);
}
