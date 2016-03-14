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

              column 'Действия' do |order|
                link_to 'Редактировать', edit_admin_order_path(order.id)
              end

              column 'Изменить статус на' do |order|
                link_to 'Отправлен', ship_admin_order_path(order.id),   
                                     method: :patch,
                                     confirm: 'Вы уверены, что нужно изменить статус заказа на "Отправлен"?'
              end
            end

            strong { link_to "Посмотреть все заказы", admin_orders_path }
          end
        end
      end

      column do
        panel "Активные запросы" do
          section do
            table_for Question.active do
              column 'Вопрос', :text
              column 'Имя', :name
              column 'Телефон', :tel
              column 'Действия' do |question|
                link_to 'Закрыть', close_admin_question_path(question.id), method: :patch
              end
            end

            strong { link_to "Посмотреть все запросы", admin_questions_path }
          end
        end
      end
    end

    columns do
      column do
        panel "Отправленные заказы" do
          section do
            table_for Order.shipped.limit(30).decorate do
              column :id
              column 'Создан', :created_at

              column 'Действия' do |order|
                link_to 'Редактировать', edit_admin_order_path(order.id)
              end

              column 'Изменить статус на' do |order|
                link_to 'Завершен', complete_admin_order_path(order.id),   
                                     method: :patch,
                                     confirm: 'Вы уверены, что нужно изменить статус заказа на "Завершен"?'
              end
            end

            strong { link_to "Посмотреть все заказы", admin_orders_path }
          end
        end
      end

      column do; end
    end

    columns do
      column do
        panel "Последние завершенные заказы" do
          section do
            table_for Order.completed.limit(5).decorate do
              column :id
              column 'Создан', :created_at

              column 'Действия' do |order|
                link_to 'Редактировать', edit_admin_order_path(order.id)
              end
            end

            strong { link_to "Посмотреть все заказы", admin_orders_path }
          end
        end
      end

      column do; end
    end
  end
end
