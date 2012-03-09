class Store < ActiveRecord::Base
  
  has_many :products

  validates :name, :presence => true
  validates :legal_name, :presence => true
  validates :rut, :is_rut => true
  
  
  composed_of :rut, 
              :class_name => "RUT",
              :mapping => %w(rut full_rut),
              :converter => Proc.new { |full_rut| RUT.new(full_rut) }
  
              
  def by_rut(full_rut_as_string)
    where(:rut => RUT.new(full_rut_as_string))
  end
  
  

  
end
