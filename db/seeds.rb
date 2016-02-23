DEFAULT_COUNT = 10

if Category.count < DEFAULT_COUNT
  DEFAULT_COUNT.times do |count|
    Category.create!(name: Faker::Lorem.word, preview: Faker::Avatar.image, 
                     background: 'https://marciepettitta2.files.wordpress.com/2011/11/backgroun-effect.jpg', 
                     slug: "cat_#{count}", desc: Faker::Lorem.sentences(5))
  end
end

if Product.count < DEFAULT_COUNT
  DEFAULT_COUNT.times do
    Product.create!(name: Faker::Lorem.word, desc: Faker::Lorem.sentence, price: rand(1..100), 
                    category: Category.all.sample, rating: rand(1.1..4.9), image: Faker::Avatar.image)
  end
end

if Post.count < DEFAULT_COUNT
  DEFAULT_COUNT.times do 
    Post.create!(title: Faker::Lorem.word, desc: Faker::Lorem.sentences(5))
  end
end