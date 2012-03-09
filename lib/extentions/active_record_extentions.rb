# encoding: utf-8
class ActiveRecord::Base
  
  # Ejemplo tomado de Rails Antipatterns
  #
  # Para los estados asociados, permite validar que sea incluído, crea scopes
  # para buscarlos por el nombre de estado y metodos booleanos para saber si 
  # el objeto
  # 
  #  *status_names: arreglo de strings con los estdos posibles de la clase
  #
  #  Ejemplos de uso
  #
  #    has_statuses %w(active inactive_by_stock inactive_by_price inactive)
  #  
  #    @some_model = SomeModel.new
  #    @some_model.active = true
  #    @some_model.active?
  #    # => true
  #    @some_model.inactive_by_price?
  #    # => false
  #  
  #    SomeModel.all_inactive_by_stock
  #    # => "SELECT * FROM some_models WHERE status = 'inactive_by_stock'"
  #
  def self.has_statuses(status_names)
    
    validates :status,
              :presence   => true,
              :inclusion  => { :in => status_names }
  
    #scopes
    status_names.each do |status_name|
      scope "all_#{status_name}", where(:status => status_name)
    end
     
    status_names.each do |status_name|
      
      define_method "#{status_name}?" do
        status == status_name
      end
    end
  end
  
end
