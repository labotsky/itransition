class StaticPagesController < ApplicationController
  def home
    @poem = Poem.includes(:flaggings, :paragraphs, :user)
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
