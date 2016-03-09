class SearchService

  def self.call(model:, field:, query:)
    relation = model.constantize
    relation.where("#{field} LIKE ?", "%#{query}%")
  end  
end