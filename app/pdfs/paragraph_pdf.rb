# coding: utf-8
class ParagraphPdf < Prawn::Document
  def initialize(paragraph)
    super(top_margin: 40)
    font_families.update("Verdana" => {
      :normal => "app/fonts/verdana.ttf",
      :italic => "app/fonts/verdanai.ttf",
      :bold => "app/fonts/verdanab.ttf"
    })
    font "Verdana"
    @paragraph = paragraph
    paragraph_title
    paragraph_body
  end

  def paragraph_title
    text "#{@paragraph.name}", size: 30, style: :bold
  end

  def paragraph_body
    text "#{@paragraph.body}", size: 14, inline_format: true
  end
end