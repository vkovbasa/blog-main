class Telegram::PublishToTelegramService
  def initialize(post)
    @post = post
    # Включаємо назву поста та його вміст
    @message = "New Blog Post: \n#{@post.title}\n#{@post.content.to_plain_text}"
  end

  def call
    begin
      # Відправляємо повідомлення з усім текстом
      TELEGRAM_BOT_CLIENT.api.send_message(chat_id: ENV["TELEGRAM_CHANNEL_ID"], text: @message)
    rescue Telegram::Bot::Exceptions::ResponseError => e
      Rails.logger.error("Failed to send message to Telegram: #{e.message}")
    end
  end
end
