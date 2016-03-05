ActiveAdmin.register Product do

  menu label: "Товары"

  actions :index, :new, :create, :edit, :update, :destroy

  permit_params :name, :desc, :price, :rating, :category_id, :image, :height, :width, :depth, 
                :material, :related, :seo_title, :seo_description, :seo_keywords

  index do
    selectable_column
    id_column

    column "Артикул", :art
    column "Название", :name
    column "Описание", :desc
    column "Категория", :category

    actions 
  end

  form do |f|
    f.inputs do
      f.input :image, as: :file, hint: image_tag(f.object.image.url(:small))
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
