class PoemsController < ApplicationController
  before_filter :right_user, only: [:edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only:[:index, :show]
  respond_to :html, :js

  def index
    if params[:tag]
      @poems = Poem.tagged_with(params[:tag])
    else
      @poems = Poem.my_poems(current_user).includes(:flaggings, :paragraphs, :user)
    end
  end

  def show
    @poem = Poem.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PoemPdf.new(@poem)
        send_data pdf.render, filename: "#{@poem.name.delete(' ')}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def new
    @poem = Poem.new
  end

  def edit
    @poem = Poem.find(params[:id])
  end

  def create
    @poem = Poem.new(params[:poem])
    if @poem.save
      expire_fragment("left_category")
      expire_fragment(['best_poem', locale: I18n.locale])
      flash[:notice] = 'Poem was successfully created.'
    end
    respond_with(@poem)
  end

  def update
    @poem = Poem.find(params[:id])   
    if @poem.update_attributes(params[:poem])
      expire_fragment("left_category")
      expire_fragment(['best_poem', locale: I18n.locale])
    end
    respond_with(@poem)  
  end

  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy
    respond_with(@poem)
  end

  def right_user
    redirect_to root_url unless Poem.find(params[:id]).user == current_user
  end

  def like
    @poem = Poem.find(params[:id])
    if current_user.flagged?(@poem, :like)
      current_user.unflag(@poem, :like)
    else
      current_user.flag(@poem, :like)
    end
    expire_fragment(['best_poem', locale: I18n.locale])
    respond_with(@poem)
  end

end
