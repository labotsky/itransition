class CategoriesController < InheritedResources::Base
  skip_before_filter :authenticate_user!
  actions :show
end
