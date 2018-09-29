class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, 
        notice: "O Administrador (#{@admin.email}) foi cadastrado com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    # used params.dig(:anything inside params) for the first time :D
    # can use with if too to check a bunch of them at the same time
    # if params.dig(:one, :two, :three)
    passwd = params.dig(:password)
    passwd_confirmation = params.dig(:password_confirmation)

    if passwd.blank? && passwd_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, 
        notice: "O Administrador (#{@admin.email}) foi editado com sucesso"
    else
      render :edit
    end
  end

  def destroy
    admin_email = @admin.email
    
    if @admin.destroy
      redirect_to backoffice_admins_path, 
        notice: "O Administrador (#{admin_email}) foi excluído com sucesso"
    else
      render :index
    end
  end

  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end

end
