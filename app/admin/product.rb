ActiveAdmin.register Product do

  menu label: "Товары", priority: 2

  actions :index, :new, :create, :edit, :update, :destroy

  permit_params :name, :desc, :price, :rating, :category_id, :image, :height, :width, :depth, :length, 
                :material, :related, :seo_title, :seo_description, :seo_keywords, images_attributes: [:picture, :id, :_destroy]

  index do
    selectable_column
    id_column

    column "Артикул", :art
    column "Название", :name
    column "Описание", :desc
    column "Категория", :category
    column "Рейтинг", :rating

    actions 
  end

  form do |f|
    f.inputs do
      f.input :image, label: 'Основное фото', as: :file, hint: image_tag(f.object.image.url(:small)) 
      f.has_many :images do |p|
        p.input :_destroy, :as => :boolean, :label => "Удалить?" unless p.object.new_record?
        # add a _destroy field if this is an existing record (don't forget to permit this field)
        p.input :picture, :as => :file, :hint => p.object.new_record? ? "Нет фото" : f.template.image_tag(p.object.picture.url(:small))
        # add a new picture and display the image if the picture already exists
      end

      f.input :category_id, label: 'Категория', as: :select, collection: Category.all.map{|c| [c.name, c.id]}
      f.input :art, label: 'Артикул'
      f.input :name, label: 'Название'
      f.input :desc, label: 'Описание'
      f.input :price, label: 'Цена'
      f.input :rating, label: 'Рейтинг'
      f.input :height, label: 'Высота(мм)'
      f.input :width, label: 'Ширина(мм)'
      f.input :depth, label: 'Глубина(мм)'
      f.input :length, label: 'Длина(мм)'
      f.input :material, label: 'Материал'
      f.input :related, label: 'Похожие товары', placeholder: 'айди товаров через запятую'
      f.input :seo_title
      f.input :seo_description
      f.input :seo_keywords
    end

    actions
  end

end
