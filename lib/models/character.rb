class Character < ActiveRecord::Base
    belongs_to :klass
    belongs_to :race
end

