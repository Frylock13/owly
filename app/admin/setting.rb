ActiveAdmin.register Setting do

  menu label: "Настройки", priority: 9

  permit_params :value
  
  actions :index, :new, :create, :edit, :update
end
