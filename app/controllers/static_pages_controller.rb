class StaticPagesController < ApplicationController
  def home
  end

  def theme
    cookies.permanent[:theme] = params[:key]
    redirect_to root_url
  end
end
