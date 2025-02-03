
sealed class ActionEvent {
  const ActionEvent();
}

class SearchClicked extends ActionEvent {
  final String query;

  const SearchClicked(this.query);
}