class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  # connects_to database: { writing: :overwatch, reading: :overwatch_replica }
end
