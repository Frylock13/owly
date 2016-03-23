include ActiveAdminHelpers

ActiveAdmin.register Order do

  menu label: "Заказы", priority: 3

  actions :index, :show, :edit, :update, :destroy

  permit_params :name, :tel, :email, :city, :street, :building, :block, :apt, :floor,
                :company_name, :inn, :comment, :admin_comment, :status, :kpp

  index do
    selectable_column
    id_column

    column "Статус" do |order|
      convert_status(order.status)
    end

    column "Имя", :name
    column "Телефон", :tel
    column "Email", :email
    column "Город", :city
    column "Улица", :street
    column "Дом", :building
    column "Корпус", :block
    column "Квартира", :apt
    column "Этаж", :floor
    column "Компания", :company_name
    column "ИНН",   :inn
    column "КПП",   :kpp
    column "Комментарий",   :comment
    actions 
  end

  form do |f|
    f.inputs do
      f.input :status, label: 'Статус заказа', as: :select, 
                       collection: [['В ожидании', :pending], ['Отправлен', :shipped],
                                    ['Завершен', :completed], ['Отменен', :cancelled]]#Order.statuses.keys
      f.input :name, label: 'Имя'
      f.input :tel, label: 'Телефон'
      f.input :email, label: 'Email'
      f.input :city, label: 'Город'
      f.input :street, label: 'Улица'
      f.input :building, label: 'Дом'
      f.input :block, label: 'Корпус'
      f.input :apt, label: 'Квартира'
      f.input :floor, label: 'Этаж'
      f.input :company_name, label: 'Компания'
      f.input :inn, label: 'ИНН'
      f.input :kpp, label: 'КПП'
      f.input :comment, label: 'Комментарий'
      f.input :admin_comment, label: 'Комментарий от администратора'
    end

    actions
  end

  show do
    attributes_table do
      row 'Статус заказа' do
        convert_status(order.status)
      end

      row 'Имя' do
        order.name
      end

      row 'Телефон' do
        order.tel
      end

      row 'Email' do
        order.email
      end

      row 'Город' do
        order.city
      end

      row 'Улица' do
        order.street
      end

      row 'Дом' do
        order.building
      end

      row 'Корпус' do
        order.block
      end

      row 'Квартира' do
        order.apt
      end

      row 'Этаж' do
        order.floor
      end

      row 'Комментарий' do
        order.comment
      end

      row 'Компания' do
        order.company_name
      end

      row 'ИНН' do
        order.inn
      end

      row 'Коммент ' do
        order.comment
      end

      row 'Коммент от администратора' do
        order.admin_comment
      end

      render partial: 'products', locals: { products: GetProductsList.call(eval(order.products)) }
    end
  end

  member_action :ship, method: :patch do
    resource.shipped!
    redirect_to :back, notice: "Статус товара успешно изменен."
  end

  member_action :complete, method: :patch do
    resource.completed!
    redirect_to :back, notice: "Статус товара успешно изменен."
  end
end
