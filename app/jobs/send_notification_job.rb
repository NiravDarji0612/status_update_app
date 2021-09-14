class SendNotificationJob < ApplicationJob
  queue_as :default
  self.queue_adapter = :resque

  def perform(status)
    UserMailer.send_notification_mail(article).deliver_now
  end
end
