# encoding: utf-8
require "#{Rails.root}/lib/extentions/active_record_extentions.rb"
class Product < ActiveRecord::Base
  include Publishable
  
  belongs_to :store
  
  # validar los estados
  ALLOWED_STATES = %w(active inactive_by_stock inactive_by_price inactive)
  has_statuses ALLOWED_STATES
  
  #precio minimo
  MINIMUM_PRICE = 1000
  MINIMUM_STOCK = 5
  
  validates :store_id,    :presence => true
  validates :cost,        :presence => true
  validates :price,       :presence => true
  
  
  delegate :name,
           :to          => :store,
           :prefix      => true,
           :allow_nill  => true
           

  def promo_message
   "- Las mejores ofertas en Farox.com!"
  end         

  
end

