ActiveAdmin.register Category do

  menu label: "Категории"

  permit_params :name, :desc, :slug, :preview, :background

  index do
    selectable_column
    column "Название", :name
    column "Описание", :desc
    column "Ссылка", :slug
    column "Превью", :preview
    actions 
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :desc#, as: :html_editor
      f.input :slug
      f.input :preview
    end

    actions
  end
end
