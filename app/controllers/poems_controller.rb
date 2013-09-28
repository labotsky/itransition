class PoemsController < InheritedResources::Base
  skip_before_filter :authenticate_user!, only:[:index, :show]
  load_and_authorize_resource
  respond_to :html, :js

  def index
    if params[:tag]
      @poems = Poem.tagged_with(params[:tag])
      @paragraphs = Paragraph.tagged_with(params[:tag])
    else
      @poems = PoemDecorator.my_poems(current_user).includes(:flaggings, :paragraphs, :user).decorate
    end
  end

  def show
    super do |format|
      format.pdf do
        pdf = PoemPdf.new(@poem)
        send_data pdf.render, filename: "#{@poem.name.delete(' ')}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def create
    create! do
      expire_fragment(['left_category', locale: I18n.locale])
      expire_fragment(['best_poem', locale: I18n.locale])
    end
  end

  def update
    update! do
      expire_fragment(['left_category', locale: I18n.locale])
      expire_fragment(['best_poem', locale: I18n.locale])
    end
  end

private

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
