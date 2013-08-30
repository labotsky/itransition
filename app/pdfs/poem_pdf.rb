class PoemPdf < Prawn::Document
  def initialize(poem)
    super(top_margin: 40)
    font_families.update("Verdana" => {
      :normal => "app/fonts/verdana.ttf",
      :italic => "app/fonts/verdanai.ttf",
      :bold => "app/fonts/verdanab.ttf"
    })
    font "Verdana"    
    @poem = poem
    poem_title
    poem_chapters
    poem_chapters_body
  end

  def poem_title
    text "Author: #{@poem.user.email}", size: 12, style: :italic, :align => :right
    text "#{@poem.name}", size: 30, style: :bold
  end

  def poem_chapters
    move_down 20
    text "PARAGRAPHS", size: 24
    @poem.paragraphs.each_with_index do |p,i|      
      text "#{i+1}: #{p.name}", :inline_format => true, size:20
    end
  end

  def poem_chapters_body
    move_down 20    
    @poem.paragraphs.each_with_index do |p,i|      
      text "<strong>#{p.name}</strong>", :inline_format => true, size:20
      text "#{p.body}", :inline_format => true, size: 16
    end
  end
end