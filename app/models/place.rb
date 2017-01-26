class Place < ApplicationRecord
  belongs_to :city
  belongs_to :county
  belongs_to :edutype
end
