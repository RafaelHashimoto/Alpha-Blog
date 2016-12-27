class Category < ActiveRecord::Base

   validates :name, presence: true, lenght {minimum: 3, maximum: 25}
   validates_uniqueness_of :name

end