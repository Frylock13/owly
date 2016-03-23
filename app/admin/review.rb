ActiveAdmin.register Review do

  menu label: "Отзывы", priority: 5

  actions :index, :new, :create, :edit, :update, :destroy

  permit_params :name, :email, :text, :rating, :product_id

  index do
    selectable_column
    column "Имя", :name
    column "Email", :email
    column "Отзыв", :text
    column "Рейтинг", :rating
    column "Товар", :product

    actions 
  end

  form do |f|
    f.inputs do
      f.input :name, label: 'Имя'
      f.input :email, label: 'Email'
      f.input :text, label: 'Отзыв'
      f.input :rating, label: 'Рейтинг'
      f.input :product, label: 'Товар'
    end

    actions
  end

  member_action :approve, method: :patch do
    resource.approved!
    redirect_to :back, notice: "Отзыв подтвержден."
  end

  member_action :delete, method: :delete do
    resource.destroy
    redirect_to :back, notice: "Отзыв удален."
  end
end
