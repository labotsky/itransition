class ParagraphsController < ApplicationController
  before_filter :authenticate_user!, except:[:show]
  def show
    @paragraph = Paragraph.find(params[:id])
    respond_to do |format|
      format.html { render layout: 'paragraph' }
    end
  end

  def new
    @paragraph = Paragraph.new
    respond_to do |format|
      format.html
    end
  end


  def edit
    @paragraph = Paragraph.find(params[:id])
  end

  def create
    @paragraph = Paragraph.new(params[:paragraph])
    respond_to do |format|
      if @paragraph.save
        format.html { redirect_to @paragraph, notice: 'Paragraph was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end


  def update
    @paragraph = Paragraph.find(params[:id])
    respond_to do |format|
      if @paragraph.update_attributes(params[:paragraph])
        format.html { redirect_to @paragraph, notice: 'Paragraph was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @paragraph = Paragraph.find(params[:id])
    @paragraph.destroy
    respond_to do |format|
      format.html { redirect_to paragraphs_url }
    end
  end
end
