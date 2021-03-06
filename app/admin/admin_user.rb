ActiveAdmin.register AdminUser do

  menu label: "Админы", priority: 11

  permit_params :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :role
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password, label: 'Пароль'
      f.input :password_confirmation, label: 'Подтверждение пароля'
      f.input :role, label: 'Роль', as: :select, collection: [['Админ', 'admin'], ['Модератор', 'moderator']]#Order.statuses.keys
    end
    f.actions
  end

end
