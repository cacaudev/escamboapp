class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index

  # If the admin has full access he can see all other admins
  # else only see other admins with restricted access
  def index
    # @admins = Admin.with_full_access
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path,
        success: t('alerts.created_alert', item: @admin.email)
        #notice: t('alerts.created_alert', item: @admin.email)
    else
      render :new
    end
  end

  def edit
    # Uses set_admin to get admin
  end

  def update
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path,
        success: t('alerts.updated_alert', item: @admin.email)
        #notice: t('alerts.updated_alert', item: @admin.email)
    else
      render :edit
    end
  end

  def destroy
    authorize @admin
    admin_email = @admin.email

    if @admin.destroy
      redirect_to backoffice_admins_path,
        success: t('alerts.deleted_alert', item: admin_email)
        #notice: t('alerts.deleted_alert', item: admin_email)
    else
      render :index
    end
  end

  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      if password_blank?
        params[:admin].except!(:password, :password_confirmation)
      end

      if @admin.blank?
        # For create action
        params.require(:admin)
          .permit(:name, :email, :role, :password, :password_confirmation)
      else
        # For edit, update and destroy actions
        params.require(:admin).permit(policy(@admin).permitted_attributes)
      end
    end

    def password_blank?
      params.dig(:password).blank? &&
      params.dig(:password_confirmation).blank?
    end

end
