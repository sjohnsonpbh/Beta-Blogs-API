class BlogBlueprint < Blueprinter::Base 
  identifier :id 
  fields :title, :content, :image_path, :created_at, :sub_title, :user, :categories 
end