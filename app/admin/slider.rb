ActiveAdmin.register Slider do

  menu label: "Слайдер", priority: 9

  permit_params :image, :enable

  index do
    selectable_column
    
    column "Превью" do |slider|
      image_tag slider.image.url(:preview)
    end
    column "Включен", :enable

    actions
  end

  form do |f|
    f.inputs do
      f.input :image, label: 'Изображение', as: :file, hint: image_tag(f.object.image.url(:preview)) 
      f.input :enable
    end

    actions
  end
end
