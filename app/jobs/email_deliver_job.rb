# Job Classの定義
class EmailDeliverJob < ActiveJob::Base
  queue_as :default

  def perform(email, message)
    # controller(アプリ側)で行っていた処理(以下)が移動された
    inquiry = Inquiry.new(name: "運営部", message: message, email: email)
    InquiryMailer.send_mail(inquiry).deliver_now
  end

end