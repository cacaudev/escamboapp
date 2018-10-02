class BackofficeController < ApplicationController
  before_action :authenticate_admin!
  layout "backoffice"

  # customized user type in pundit
  def pundit_user
    current_admin # current_user to Pundit
  end

end
