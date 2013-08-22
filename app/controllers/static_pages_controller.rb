class StaticPagesController < ApplicationController
  def home
    @poem = Poem.all
  end

  def theme
    @key = params[:key]
    cookies.permanent[:theme] = @key
    respond_to do |format|
      format.js
    end
  end
end
