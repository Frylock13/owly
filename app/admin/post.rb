ActiveAdmin.register Post do

  menu label: "Блог", priority: 6

  actions :index, :new, :create, :edit, :update, :destroy

  permit_params :title, :text, :image, :tags, :seo_title, :seo_description, :seo_keywords

  index do
    selectable_column
    id_column

    column "Заголовок", :title
    column "Текст", :text
    column "Тэги", :tags
    column :seo_title
    column :seo_description
    column :seo_keywords

    actions 
  end

  form do |f|
    f.inputs do
      f.input :title, label: 'Заголовок'
      f.input :text, label: 'Текст'
      f.input :tags, label: 'Описание'
      f.input :image, label: 'Изображение'
      f.input :tags, label: 'Тэги'
      f.input :seo_title
      f.input :seo_description
      f.input :seo_keywords
    end

    actions
  end

end
