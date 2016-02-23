class ProductSorting

  def self.call(sort=nil, category_id)
    products = Product.where(category_id: category_id)

    if sort
      products.send(sort.to_sym)
    else
      products
    end
  end

end