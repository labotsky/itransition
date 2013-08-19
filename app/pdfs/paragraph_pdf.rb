class ParagraphPdf < Prawn::Document
  def initialize(paragraph)
    super(top_margin: 40)
    @paragraph = paragraph
    paragraph_title
    paragraph_body
  end

  def paragraph_title
    text "#{@paragraph.name}", size: 30, style: :bold
  end

  def paragraph_body
    text "#{@paragraph.body}", size: 14
  end
end