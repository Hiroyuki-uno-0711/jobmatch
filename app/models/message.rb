class Message < ApplicationRecord

  belongs_to :user
  belongs_to :room

  # def create_notification_message!(current_user)
  #   temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, user_id, 'message'])
  #   if temp.blank?
  #     notification = current_user.active_notifications.new(
  #       visited_id: user_id,
  #       action: 'message'
  #     )
  #     if notification.visitor_id == notification.visited_id
  #       notification.checked = true
  #     end

  #     notification.save if notification.valid?
  #   end
  # end

end
