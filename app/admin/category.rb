ActiveAdmin.register Category do

  menu label: "Категории"

  actions :index, :new, :create, :edit, :update, :destroy

  permit_params :name, :desc, :slug, :preview, :background

  index do
    selectable_column
    column "Название", :name
    column "Описание", :desc
    column "Ссылка", :slug
    column "Превью" do |category|
      image_tag category.preview.url(:small)
    end
    actions 
  end

  form do |f|
    f.inputs do
      f.input :name, label: 'Название'
      f.input :desc, as: :html_editor, label: 'Описание'
      f.input :slug, label: 'Ссылка'
      f.input :preview, label: 'Превью'
      f.input :background, label: 'Фон'
      f.input :seo_title, label: 'SEO title'
      f.input :seo_description, label: 'SEO description'
      f.input :seo_keywords, label: 'SEO keywords'
    end

    actions
  end
end
