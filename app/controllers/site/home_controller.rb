class Site::HomeController < SiteController
  def index
    @categories = Category.order_by_description
    @ads = Ad.ads_by_descending_order(6)
  end
end
