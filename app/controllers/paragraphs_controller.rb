class ParagraphsController < ApplicationController
  before_filter :authenticate_user!, except:[:show]
  def show
    @paragraph = Paragraph.find(params[:id])
    respond_to do |format|
      format.html { render layout: 'paragraph' }
      format.pdf do
        pdf = ParagraphPdf.new(@paragraph)
        send_data pdf.render, filename: "#{@paragraph.name.delete(' ')}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
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
        expire_fragment("left_paragraph")
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
        expire_fragment("left_paragraph")
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
      expire_fragment("left_paragraph")
      format.html { redirect_to paragraphs_url }
    end
  end
end
