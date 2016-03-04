class GetProductsList

  def self.call(hash)
    products = Product.where(id: hash.keys)

    products.each do |product|
      count = hash[product.id.to_s]
      product.define_singleton_method(:count) { count }
    end

    products
  end

end