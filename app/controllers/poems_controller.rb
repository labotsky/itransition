class PoemsController < ApplicationController

  before_filter :right_user, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!, except:[:show]

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
    respond_to do |format|
      if @poem.save
        format.html { redirect_to @poem, notice: 'Poem was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @poem = Poem.find(params[:id])   
    if @poem.update_attributes(params[:poem])
      redirect_to @poem
    end  
  end

  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy
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
    respond_to do |format|
      format.js
    end
  end

end
