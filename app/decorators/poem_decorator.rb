class PoemDecorator < Draper::Decorator
  delegate_all

  def view_button
    h.link_to h.t('button.view'), h.poem_path(model), class: "btn btn-small"
  end

  def pdf_button
    h.link_to h.poem_path(model, format: "pdf"), class: "set btn btn-warning btn-small pull-right animated" do
      "<i class='icon-download-alt'></i> PDF".html_safe
    end  
  end

  def edit_button
    h.link_to h.edit_poem_path(model), class: "btn btn-small btn-info " do
      "<i class='icon-edit'></i>
      #{h.t('button.edit')}".html_safe
    end    
  end

  def delete_button
    h.link_to h.poem_path(model), method: :delete, confirm: 'You sure?', class:"btn btn-small btn-danger" do
      "<i class='icon-trash'></i>
      #{h.t('button.delete')}".html_safe
    end    
  end

  def add_paragraph_button
    h.link_to h.new_poem_paragraph_path(poem_id: model), class:"btn btn-small" do
      "<i class='icon-plus'></i>
      #{h.t('button.addparagraph')}
      <strong>#{model.paragraphs.size}</strong>".html_safe
    end  
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
