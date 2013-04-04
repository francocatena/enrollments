class Course < ActiveRecord::Base
  include Courses::Validations
end
