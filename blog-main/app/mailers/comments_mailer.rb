class CommentsMailer < ApplicationMailer
  def submitted(comment)
    @comment = comment
    mail(to: "blog-owner@example.org", subject: "New Comment Submitted")
  end
end
