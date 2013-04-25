class V1::CategoriesController < V1::BaseController
  expose(:categories)

  def index
    respond_with(categories)
  end
end
