ActiveAdmin.register Question do

  menu label: "Вопросы"

  actions :index, :edit, :update, :destroy

  permit_params :closed

  index do
    selectable_column

    column "Имя", :name
    column "Телефон", :tel
    column "Вопрос", :text
    column "Закрыт", :closed

    actions 
  end

  form do |f|
    f.inputs do
      f.input :closed, label: 'Закрыто'
    end

    actions
  end

end
