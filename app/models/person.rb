class Person < ActiveRecord::Base
  include People::Validations
end
