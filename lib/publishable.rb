# encoding: utf-8
module Publishable
  extend ActiveSupport::Concern

  #acá puede añadir tantos módulos como necesite.
  
  included do
    validates   :description, :presence => true
    validates   :title,       :presence => true
    before_save :create_friendly_url
    after_create  :add_promo_to_description
    scope :invalid, where(["description= ? AND title=?", nil, nil])
    
  end
  
  def promo_message
    "- Las mejores ofertas en Falabella!"
  end
  
  def create_friendly_url
    self[:friendly_url] = self[:title].strip.gsub(/\s+/, '-').downcase
  end
  
  def description
    self[:description] || 'No disponible'
  end
  
  # Public - ingresa e
  def add_promo_to_description
    self[:description] = "#{txt} #{promo_message}" 
  end
  
  def status_name
    self[:status].capitalize.gsub("_", " ")
  end
  
  
end