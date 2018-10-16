class Backoffice::SendMailController < ApplicationController

  def edit
    @admin = Admin.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    begin
      AdminMailer.send_message(current_admin, 
                               params[:'recipient-text'],
                               params[:'subject-text'],
                               params[:'message-text']).deliver_now
      @notify_message = t('alerts.email_sent_sucessfully_alert')
      @notify_flag = "success"
    rescue
      @notify_message = t('alerts.email_error_alert')
      @notify_flag = "error"
    end
                             
    respond_to do |format|
      format.js
    end
  end
end
