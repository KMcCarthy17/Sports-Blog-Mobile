class CollegeFootball{
  int post_id;
  String title;
  String author;
  String blog_body;
  String posted_timestamp;

  CollegeFootball({this.post_id, this.title, this.author, this.blog_body,
      this.posted_timestamp});

  factory CollegeFootball.fromJson(Map<String,dynamic> obj){
    return CollegeFootball(
        post_id: obj['post_id'],
        title: obj['title'],
        author: obj['author'],
        blog_body: obj['blog_body'],
        posted_timestamp: obj['posted_timestamp']
    );
  }

  @override
  String toString() {
    return 'CollegeFootball{post_id: $post_id, title: $title, author: $author, blog_body: $blog_body, posted_timestamp: $posted_timestamp}';
  }


}