class Purchase < ApplicationRecord
  belongs_to :product
  belongs_to :client
  belongs_to :admin
end
