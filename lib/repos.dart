class repos {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  String? visibility;
  int? forks;
  int? openIssues;
  int? watchers;
  String? defaultBranch;

  repos(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.private,
      this.visibility,
      this.forks,
      this.openIssues,
      this.watchers,
      this.defaultBranch});

  repos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    visibility = json['visibility'];
    forks = json['forks'];
    openIssues = json['open_issues'];
    watchers = json['watchers'];
    defaultBranch = json['default_branch'];
  }

  
}
