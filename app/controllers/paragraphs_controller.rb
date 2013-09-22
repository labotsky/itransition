class ParagraphsController < InheritedResources::Base
  skip_before_filter :authenticate_user!, only:[:show]
  belongs_to :poem, :optional => true
  actions :all, except: [:index]
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

  def create
    create!{expire_fragment("left_paragraph")}
  end

  def update    
    update!{expire_fragment("left_paragraph")}
  end

  def destroy    
    destroy!{expire_fragment("left_paragraph")}
  end
end
