class Administrador < ActiveRecord::Base
  has_many :concursos, :dependent => :destroy
end
