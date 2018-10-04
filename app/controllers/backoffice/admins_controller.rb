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
        notice: t('messages.created_alert', item: @admin.email)
    else
      render :new
    end
  end

  def edit
    authorize @admin
  end

  def update
    passwd = params.dig(:password)
    passwd_confirmation = params.dig(:password_confirmation)
  
    if passwd.blank? && passwd_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end
    
    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, 
        notice: t('messages.updated_alert', item: @admin.email)
    else
      render :edit
    end
  end

  def destroy
    authorize @admin
    admin_email = @admin.email

    if @admin.destroy
      redirect_to backoffice_admins_path, 
        notice: t('messages.deleted_alert', item: admin_email)
    else
      render :index
    end
  end

  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      params.require(:admin).permit(policy(@admin).permitted_attributes)
    end

end
