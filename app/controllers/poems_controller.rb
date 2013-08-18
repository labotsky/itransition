class PoemsController < ApplicationController
  before_filter :right_user, only: [:edit, :update, :destroy]

  def index
    @poems = Poem.all
  end

  def show
    @poem = Poem.find(params[:id])
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

end
