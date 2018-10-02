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
      render :new
    else
      redirect_to backoffice_categories_path, 
      notice: I18n.t('messages.created_alert', item: @category.description)
    end
  end

  def edit
  end

  def update
    if @category.update(params_category)
      redirect_to backoffice_categories_path, 
        notice: I18n.t('messages.updated_alert', item: @category.description)
    else
      render :edit
    end
  end

  def destroy
    category_description = @category.description
    if @category.destroy
      redirect_to backoffice_categories_path, 
        notice: I18n.t('messages.deleted_alert', item: category_description)
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
