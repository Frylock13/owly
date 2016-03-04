ActiveAdmin.register Order do

  menu label: "Заказы"

  actions :index, :show, :edit, :update, :destroy

  permit_params :name, :desc, :slug, :preview, :background

  index do
    selectable_column
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
    actions 
  end

  show do
    attributes_table do
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

      row 'Компания' do
        order.company_name
      end

      row 'ИНН' do
        order.inn
      end

      render partial: 'products', locals: { products: GetProductsList.call(eval(order.products)) }
    end
  end

end
