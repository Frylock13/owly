DEFAULT_COUNT = 40

DEFAULT_COUNT.times do |count|
  Category.create!(name: Faker::Lorem.word, preview: Faker::Avatar.image, 
                   background: 'https://marciepettitta2.files.wordpress.com/2011/11/backgroun-effect.jpg', 
                   name: "cat_#{count}", desc: Faker::Lorem.sentences(5))
end

DEFAULT_COUNT.times do |count|
  Product.create!(id: count, name: Faker::Lorem.word, desc: Faker::Lorem.sentence, price: rand(1..100), 
                  category: Category.all.sample, image: Faker::Avatar.image,
                  height: rand(0..100), width: rand(0..100), depth: rand(0..100),
                  material: Faker::Lorem.sentences, related: "5, 6, 3, 2", art: rand(0..4000))
end

DEFAULT_COUNT.times do 
  Post.create!(title: Faker::Lorem.word, text: Faker::Lorem.sentences(5), tags: 'tag1, tag2',
               image: File.new("#{Rails.root}/app/assets/images/pages/blog/post-bg.jpg"))
end


AdminUser.create(email: 'admin@gmail.com', password: 'password') if AdminUser.count == 0

Page.create(slug: 'blog', text: Faker::Lorem.sentences(5), image: File.new("#{Rails.root}/app/assets/images/pages/blog/bg.jpg"),
            heading: 'Добро пожаловать в блог Оули!')
Page.create(slug: 'our_products', text: Faker::Lorem.sentences(5), image: File.new("#{Rails.root}/app/assets/images/pages/our_products/bg.jpg"),
            heading: 'Изделия от оули -')
Page.create(slug: 'about', text: Faker::Lorem.sentences(5), image: File.new("#{Rails.root}/app/assets/images/pages/about/bg.jpg"),
            heading: 'Знакомьтесь, Это Оули!')
Page.create(slug: 'carts', text: 'На этой странице Вы можете оформить заказ на все изделия, которые выбрали на нашем сайте. При заказе на сумму от 3 000 руб. мы осуществляем бесплатную доставку по городу!', 
            image: File.new("#{Rails.root}/app/assets/images/pages/cart/bg.jpg"),
            heading: 'Ваша корзина')
Page.create(slug: 'favorites', text: 'Если Вы еще не приняли решение о приобретении каких-либо изделий от Оули, или у Вас нет времени оформить заказ сразу, Вы всегда можете вернуться к своим избранным изделиям на этой странице!', 
            image: File.new("#{Rails.root}/app/assets/images/pages/favorites/bg.jpg"),
            heading: 'Изделия, которые вы выбрали')
Page.create(slug: 'how_to', text: Faker::Lorem.sentences(5), 
            image: File.new("#{Rails.root}/app/assets/images/pages/how_to/bg.jpg"),
            heading: 'Как заказать наши изделия?')
Page.create(slug: 'contacts', text: Faker::Lorem.sentences(5), 
            image: File.new("#{Rails.root}/app/assets/images/pages/contacts/bg.jpg"),
            heading: 'Как с нами связаться?')
Page.create(slug: 'home', heading: 'Главная', text: 'Description')
Page.create(slug: 'search', heading: 'Поиск')
Page.create(slug: 'warranty', heading: 'Возврат товара и гарантии')

Setting.create(key: 'mailchimp_key', value: 'api_key')
Setting.create(key: 'mailchimp_list_id', value: 'list_id')
Setting.create(key: 'blog_tags', value: 'first,second')
Setting.create(key: 'admin_email', value: 'test@gmail.com')