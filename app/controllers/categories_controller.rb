class CategoriesController < ApplicationController
  skip_before_filter :authenticate_user!

  def show
    @category = Category.find(params[:id])
  end
end
