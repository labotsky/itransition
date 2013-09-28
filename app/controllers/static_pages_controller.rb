class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!
  def home
    @poem = PoemDecorator.includes(:flaggings, :paragraphs, :user).decorate
  end

  def theme
    @key = params[:key]
    cookies.permanent[:theme] = @key
    respond_to do |format|
      format.js
    end
  end

  def search
    @poem = Poem.search(params[:search])
  end
end
