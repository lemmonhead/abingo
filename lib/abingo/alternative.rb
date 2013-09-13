require 'active_record'
require_relative 'conversion_rate'

class Abingo::Alternative < ActiveRecord::Base
  include Abingo::ConversionRate

  belongs_to :experiment, :class_name => "Abingo::Experiment"
  serialize :content

  def self.calculate_lookup(test_name, alternative_name)
    Digest::MD5.hexdigest(Abingo.salt + test_name + alternative_name.to_s)
  end

  def self.score_conversion(test_name)
    viewed_alternative = Abingo.find_alternative_for_user(test_name,
      Abingo::Experiment.alternatives_for_test(test_name))
    self.where(lookup: self.calculate_lookup(test_name, viewed_alternative)).update_all("conversions = conversions + 1")
  end

  def self.score_participation(test_name)
    viewed_alternative = Abingo.find_alternative_for_user(test_name,
      Abingo::Experiment.alternatives_for_test(test_name))
    self.where(lookup: self.calculate_lookup(test_name, viewed_alternative)).update_all("participants = participants + 1")
  end

end