require "active_support/concern"

module Percentile
  extend ActiveSupport::Concern
  included do
    # customize default method_missing
    def method_missing(method_name, *args, &block)
      super unless method_name.to_s.include? '_percentile'
      true_method_name = method_name.to_s.split('_percentile')[0]
      if true_method_name
        # calculate percentile for this attribute
        scores_array = self.class.all.map{ |instance| instance.send(true_method_name)}.compact.select(&:nonzero?)
        score = self.send(true_method_name)
        return percentile(score, scores_array)
      end
      super(method, *args, &block)
    end
  end

  # The methods added inside the class_methods block (or, ClassMethods module)
  # become the class methods on the including class.
  # class_methods do
  #   def count_all_visible
  #     all.select { |item| item.is_visible? }
  #   end
  # end

  private

  def percentile(score, scores_array)
    number_of_values_below_score = scores_array.select{ |val| val < score }.length
    total_number_of_scores       = scores_array.length
    percentile                   = (number_of_values_below_score.to_f) / (total_number_of_scores.to_f) * 100.0
  end
  
end
