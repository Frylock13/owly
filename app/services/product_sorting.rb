class ProductSorting

  def self.call(sort=nil, category_id)
    products = Product.where(category_id: category_id)

    # If sort param is passed than @inctance.sort_method 
    # Or get all products
    sort ? products.send(sort.to_sym) : products
  end

end