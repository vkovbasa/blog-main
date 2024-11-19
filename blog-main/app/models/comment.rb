class Comment < ApplicationRecord
  belongs_to :post
  broadcasts_to :post
  validates :content, presence: true, length: { minimum: 5, maximum: 500 }
  after_create_commit :send_notification

  private

  def send_notification
    CommentsMailer.submitted(self).deliver_later
  end
end
