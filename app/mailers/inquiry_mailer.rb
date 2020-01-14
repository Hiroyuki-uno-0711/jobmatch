class InquiryMailer < ApplicationMailer

  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'jobcheck.app@gmail.com',
      to:   'do.for.me.affiliate@gmail.com',
      # to:   @inquiry.email
      subject: 'お問い合わせ通知'
    )
  end

end