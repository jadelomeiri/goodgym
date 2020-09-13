# Preview all emails at http://localhost:3000/rails/mailers/waiting_list_mailer
class WaitingListMailerPreview < ActionMailer::Preview
  def notification_email
    WaitingListMailer.with(user: User.first, run: Run.first).notification_email
  end
end
