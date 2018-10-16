class AdminMailer < ApplicationMailer

  def update_email(current_admin, admin)
    @current_admin = current_admin
    @admin = admin
    mail(to: @admin.email, 
         subject: t('alerts.your_data_has_been_changed_alert'))
  end
  
  def send_message(current_admin, recipient, subject, message)
    @current_admin = current_admin
    @recipient = recipient
    @subject = subject
    @message = message
    mail(to: @recipient, subject: @subject)
  end
end
