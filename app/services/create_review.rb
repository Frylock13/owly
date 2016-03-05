class CreateReview

  def initialize(review, rating)
    @review = review
    @rating = rating.to_f
    @product = @review.product
  end

  def call
    ActiveRecord::Base.transaction do
      @review.rating = @rating
      @review.save
      @product.update(rating: new_rating)
    end
  end

  private

  def new_rating
    reviews = @product.reviews

    # Adding the new rating param to an existing rating array 
    all_evaluations = reviews.pluck(:rating) << @rating
    calculate(all_evaluations)
  end

  def calculate(all_evaluations)
    # [3.0, 4.0 5.0] => 3.0 + 4.0 + 5.0 = 12.0
    evaluations_adding = all_evaluations.reduce(:+)

    # Get a count of the new rating array(3.0 for example)
    evaluations_count = all_evaluations.count.to_f

    # Calculating of an arithmetic average (12.0 / 3.0) 
    evaluations_adding / evaluations_count
  end

end