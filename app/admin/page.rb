ActiveAdmin.register Page do

  menu label: "Страницы"

  actions :index, :edit, :update, :destroy

  permit_params :text, :heading, :slug, :image, :seo_title, :seo_description, :seo_keywords

  index do
    selectable_column
    column "Заголовок", :heading
    column "Описание", :text
    column "Ссылка", :slug
    actions 
  end

  form do |f|
    f.inputs do
      f.input :heading, label: 'Название'
      f.input :text, label: 'Описание'
      f.input :slug, label: 'Ссылка'
      f.input :seo_title, label: 'SEO title'
      f.input :seo_description, label: 'SEO description'
      f.input :seo_keywords, label: 'SEO keywords'
    end

    actions
  end
end
