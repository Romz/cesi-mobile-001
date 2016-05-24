class Store < ActiveRecord::Base
  scope :by_name, -> (name) { where("name like ?", "%#{name}%")}
  scope :by_city, -> (city) { where("city like ?", "%#{city}%")}
end
