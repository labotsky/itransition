ThinkingSphinx::Index.define :poem, :with => :active_record do
  indexes name, description, body
end