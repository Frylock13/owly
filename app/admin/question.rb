ActiveAdmin.register Question do

  menu label: "Запросы", priority: 4

  actions :index, :destroy

  permit_params :closed

  index do
    selectable_column

    column "Имя", :name
    column "Телефон", :tel
    column "Вопрос", :text
    column "Статус", :status
    column "Создан", :created_at

    actions 
  end

  form do |f|
    f.inputs do
      f.input :closed, label: 'Закрыто'
    end

    actions
  end

  member_action :close, method: :patch do
    resource.closed!
    redirect_to :back, notice: "Запрос закрыт!"
  end

end
