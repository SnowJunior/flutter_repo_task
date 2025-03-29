
class GithubRepo {
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final bool? private;
  final Owner? owner;
  final String? htmlUrl;
  final String? description;
  final bool? fork;
  final String? url;
  final String? cloneUrl;
  final String? sshUrl;
  final String? homepage;
  final int? size;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final bool? hasIssues;
  final bool? hasProjects;
  final bool? hasDownloads;
  final bool? hasWiki;
  final bool? hasPages;
  final bool? hasDiscussions;
  final int? forksCount;
  final bool? archived;
  final bool? disabled;
  final int? openIssuesCount;
  final License? license;
  final bool? allowForking;
  final bool? isTemplate;
  final String? visibility;
  final String? defaultBranch;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;

  GithubRepo({
     this.id,
     this.nodeId,
     this.name,
     this.fullName,
     this.private,
     this.owner,
     this.htmlUrl,
    this.description,
     this.fork,
     this.url,
     this.cloneUrl,
     this.sshUrl,
    this.homepage,
     this.size,
     this.stargazersCount,
     this.watchersCount,
     this.language,
     this.hasIssues,
     this.hasProjects,
     this.hasDownloads,
     this.hasWiki,
     this.hasPages,
     this.hasDiscussions,
     this.forksCount,
     this.archived,
     this.disabled,
     this.openIssuesCount,
    this.license,
     this.allowForking,
     this.isTemplate,
     this.visibility,
     this.defaultBranch,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
  });

  factory GithubRepo.fromJson(Map<String, dynamic> json) {
    return GithubRepo(
      id: json['id'] ?? 0,
      nodeId: json['node_id'] ?? '',
      name: json['name'] ?? '',
      fullName: json['full_name'] ?? '',
      private: json['private'] ?? false,
      owner: Owner.fromJson(json['owner'] ?? {}),
      htmlUrl: json['html_url'] ?? '',
      description: json['description'],
      fork: json['fork'] ?? false,
      url: json['url'] ?? '',
      cloneUrl: json['clone_url'] ?? '',
      sshUrl: json['ssh_url'] ?? '',
      homepage: json['homepage'],
      size: json['size'] ?? 0,
      stargazersCount: json['stargazers_count'] ?? 0,
      watchersCount: json['watchers_count'] ?? 0,
      language: json['language'] ?? 'Unknown',
      hasIssues: json['has_issues'] ?? false,
      hasProjects: json['has_projects'] ?? false,
      hasDownloads: json['has_downloads'] ?? false,
      hasWiki: json['has_wiki'] ?? false,
      hasPages: json['has_pages'] ?? false,
      hasDiscussions: json['has_discussions'] ?? false,
      forksCount: json['forks_count'] ?? 0,
      archived: json['archived'] ?? false,
      disabled: json['disabled'] ?? false,
      openIssuesCount: json['open_issues_count'] ?? 0,
      license: json['license'] != null ? License.fromJson(json['license']) : null,
      allowForking: json['allow_forking'] ?? false,
      isTemplate: json['is_template'] ?? false,
      visibility: json['visibility'] ?? 'public',
      defaultBranch: json['default_branch'] ?? 'master',
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
      pushedAt: json['pushed_at'] != null ? DateTime.tryParse(json['pushed_at']) : null,
    );
  }
}

class Owner {
  final String? login;
  final int? id;
  final String? avatarUrl;
  final String? htmlUrl;

  Owner({
     this.login,
     this.id,
     this.avatarUrl,
     this.htmlUrl,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json['login'] ?? '',
      id: json['id'] ?? 0,
      avatarUrl: json['avatar_url'] ?? '',
      htmlUrl: json['html_url'] ?? '',
    );
  }
}

class License {
  final String? key;
  final String? name;
  final String? spdxId;
  final String? url;

  License({
     this.key,
     this.name,
     this.spdxId,
     this.url,
  });

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      key: json['key'] ?? '',
      name: json['name'] ?? '',
      spdxId: json['spdx_id'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
