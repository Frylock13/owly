class ProductSearchService

  def self.call(sort:, page:, category_id:)
    products = Product.where(category_id: category_id).paginate(page: page)

    # If sort param is passed than @instance.sort_method 
    # Or get all products
    sort ? products.send(sort.to_sym) : products
  end

end