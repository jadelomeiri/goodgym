class WaitingListMailer < ApplicationMailer
  default from: 'support@goodgym.com'

  def notification_email
    @user = params[:user]
    @run  = params[:run]
    mail(to: @user.email, subject: 'Your place is now confirmed')
  end
end
