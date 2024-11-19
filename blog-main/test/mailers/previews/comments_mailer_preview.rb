class CommentsMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/comments_mailer/submitted
  def submitted
    post = Post.first || Post.create(title: "Sample Post", content: "Sample content") # Ensure there's a post
    comment = Comment.create(content: "This is a sample comment", post: post)
    CommentsMailer.submitted(comment)
  end
end
