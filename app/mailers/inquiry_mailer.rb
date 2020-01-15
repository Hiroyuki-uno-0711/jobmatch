class InquiryMailer < ApplicationMailer

  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'jobcheck.app@gmail.com',
      to:   @inquiry.email,
      subject: '通知連絡'
    )
  end

end