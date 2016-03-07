ActiveAdmin.register Setting do

  menu label: "Настройки"

  permit_params :value
  
  actions :index, :new, :create, :edit, :update
end
