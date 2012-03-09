class RUT
    
  attr_reader :rut, :dv, :full_rut
  
  def initialize(rut_val)
    
    @rut = rut_val[0..rut_val.size-2].to_s.gsub(/\D|\s/,'').to_i #eliminar espacios y caracteres distintos de numeros
    @dv  = rut_val.last.to_i
    @full_rut = @rut.to_s+@dv.to_s
    
    # necesario para usar las validaciones:
  end
  
  # Public: calcula el digito verificador de un RUT
  # Autor: Daniel Bobadilla Leal 
  # 
  #
  # Retorna el digito verificador del RUT.
  def calculate_dv
  
    r = self.rut 
    v=1 
    s=0 
    for i in (2..9) 
      if i == 8 
        v=2 
      else 
        v+=1 
      end 
      s+=v*(r%10) 
      r/=10 
    end 
    s = 11 - s%11 
    return "0" if s == 11 
    return "K" if s == 10 
    return s.to_s
  
  end
  
  
  # Public: Determina si el RUT completo es válido
  #
  # Retorna verdadero si es válido o falso de lo contrario (incluye RUT 0 y 11.111.111-1)
  def valid?
    
    return false if (rut == 0 or rut < 1000000 or rut == 11111111)
    dv.to_i == calculate_dv.to_i
  end 
  
  
  # ---------------------------------------------------------------------------
  # Public: formatea el RUT con puntos y guión
  #
  # Ejemplo:
  # rut = RUT.new("163580357")
  # rut.point_format
  # # => "16.358.035-7"
  #
  # Retorna una cadena de texto con el RUT formateado
  # ---------------------------------------------------------------------------
  def point_format
    "#{rut.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1.")}-#{dv || self.calculate_dv }"
  end
  
  #----------------------------------------------------------------------------
  # Public: Muestra el RUT formateado con puntos y guión cuando 
  # se accede al objeto
  #
  # Ejemplo:
  # rut = RUT.new("163580357")
  # rut
  # # => "16.358.035-7"
  #
  # Retorna una cadena de texto con el RUT formateado
  #----------------------------------------------------------------------------
  def to_s
    self.point_format
  end
  
  private
    def valid_rut
      unless rut.valid?
        errors.add(:rut, "Invalid RUT")
      end
    end
  
end