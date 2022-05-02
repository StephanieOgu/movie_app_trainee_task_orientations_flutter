class MoviesSearchParams {
  MoviesSearchParams({
    required this.pageNumber,
    this.searchQuery,
  });

  final int pageNumber;
  final String? searchQuery;
}
