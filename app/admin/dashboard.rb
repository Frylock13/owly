ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Активные заказы" do
          section do
            table_for Order.pending.limit(30).decorate do
              column :id
              column 'Создан', :created_at
              column 'Ссылка' do |order|
                link_to 'Перейти', admin_order_path(order.id)
              end
            end
            strong { link_to "Посмотреть все заказы", admin_orders_path }
          end
        end
      end

      column do
        panel "Активные вопросы" do
        end
      end
    end
  end
end
