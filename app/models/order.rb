class Order < ActiveRecord::Base

  enum status: %w( pending shipped completed cancelled )

end
