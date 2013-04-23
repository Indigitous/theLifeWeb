class V1::CategoriesController < V1::BaseController
  expose(:categories) { Category.includes(:activities) }

  def index
    respond_with(categories)
  end
end
