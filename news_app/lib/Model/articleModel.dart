class AutoGenerate {
  AutoGenerate({
    required this.totalArticles,
    required this.articles,
  });
  late final int totalArticles;
  late final List<Articles> articles;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    totalArticles = json['totalArticles'];
    articles =
        List.from(json['articles']).map((e) => Articles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['totalArticles'] = totalArticles;
    _data['articles'] = articles.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Articles {
  Articles({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.source,
  });
  late final String title;
  late final String description;
  late final String content;
  late final String url;
  late final String image;
  late final String publishedAt;
  late final Source source;

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    content = json['content'];
    url = json['url'];
    image = json['image'];
    publishedAt = json['publishedAt'];
    source = Source.fromJson(json['source']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['description'] = description;
    _data['content'] = content;
    _data['url'] = url;
    _data['image'] = image;
    _data['publishedAt'] = publishedAt;
    _data['source'] = source.toJson();
    return _data;
  }
}

class Source {
  Source({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Source.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}
