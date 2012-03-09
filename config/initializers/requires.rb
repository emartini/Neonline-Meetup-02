# cargar los archivos de extensión de funcionalidades


Dir[File.join(Rails.root, 'lib/extentions', '*.rb')].each do |f|
  require f
end

Dir[File.join(Rails.root, 'lib/validators', '*.rb')].each do |f|
  require f
end

Dir[File.join(Rails.root, 'lib', '*.rb')].each do |f|
  require f
end


