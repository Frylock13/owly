minimum_count = 10

if Category.count < minimum_count
  minimum_count.times do
    Category.create!(name: Faker::Lorem.word, preview: Faker::Avatar.image, background: Faker::Placeholdit.image)
  end
end

if Product.count < minimum_count
  minimum_count.times do
    Product.create!(name: Faker::Lorem.word, desc: Faker::Lorem.sentence, price: rand(1..100), category: Category.all.sample,
                    rating: rand(1.1..4.9))
  end
end

if Post.count < minimum_count
  minimum_count.times do 
    Post.create!(title: Faker::Lorem.word, desc: Faker::Lorem.sentences(5))
  end
end