ActiveAdmin.register Category do

  menu label: "Категории", priority: 2

  actions :index, :new, :create, :edit, :update, :destroy

  permit_params :name, :desc, :slug, :preview, :background, :seo_title, :seo_description, :seo_keywords, :parent_id, :sort

  index do
    selectable_column
    column "Название", :name
    column "Описание", :desc
    column "Ссылка", :slug
    column "Превью" do |category|
      image_tag category.preview.url(:small)
    end
    column "Род. категория", :parent
    column "Сортировка", :sort
    actions 
  end

  form do |f|
    f.inputs do
      f.input :parent, label: 'Род. категория'
      f.input :name, label: 'Название'
      f.input :desc, as: :html_editor, label: 'Описание'
      f.input :slug, label: 'Ссылка'
      f.input :preview, label: 'Превью'
      f.input :background, label: 'Фон'
      f.input :sort, label: 'Сортировка'
      f.input :seo_title, label: 'SEO title'
      f.input :seo_description, label: 'SEO description'
      f.input :seo_keywords, label: 'SEO keywords'
    end

    actions
  end

  controller do
    before_filter :set_category, only: [:update, :edit, :destroy]

    def set_category
      @category = Category.friendly.find(params[:id])
    end
  end
end
