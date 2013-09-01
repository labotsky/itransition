class ParagraphsController < ApplicationController
  skip_before_filter :authenticate_user!, only:[:show]
  respond_to :html

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
  end

  def edit
    @paragraph = Paragraph.find(params[:id])
  end

  def create
    @paragraph = Paragraph.new(params[:paragraph])    
    if @paragraph.save
      expire_fragment("left_paragraph")
      flash[:success] = 'Paragraph was successfully created.'
    end
    respond_with(@paragraph)
  end

  def update
    @paragraph = Paragraph.find(params[:id])
    if @paragraph.update_attributes(params[:paragraph])
      expire_fragment("left_paragraph")
      flash[:success] = 'Paragraph was successfully updated.'
    end
    respond_with(@paragraph)
  end

  def destroy
    @paragraph = Paragraph.find(params[:id])
    @paragraph.destroy
    expire_fragment("left_paragraph")
    respond_with(@paragraph)
  end
end
