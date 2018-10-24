class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = CategoryService.create(params_category)
    if @category.errors.any?
      render :new,
      #notice: I18n.t('alerts.created_error_alert', item: @category.description)
      danger: I18n.t('alerts.created_error_alert', item: @category.description)
    else
      redirect_to backoffice_categories_path, 
      #notice: I18n.t('alerts.created_alert', item: @category.description)
      success: I18n.t('alerts.created_alert', item: @category.description)
    end
  end

  def edit
  end

  def update
    if @category.update(params_category)
      redirect_to backoffice_categories_path, 
        #notice: I18n.t('alerts.updated_alert', item: @category.description)
        success: I18n.t('alerts.updated_alert', item: @category.description)
    else
      render :edit
    end
  end

  def destroy
    category_description = @category.description
    if @category.destroy
      redirect_to backoffice_categories_path, 
        # notice: I18n.t('alerts.deleted_alert', item: category_description)
        success: I18n.t('alerts.deleted_alert', item: category_description)
    else
      render :index
    end
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def params_category
      params.require(:category).permit(:description)
    end

end
