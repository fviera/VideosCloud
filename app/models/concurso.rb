class Concurso < ActiveRecord::Base
  belongs_to :administrador
  has_many :videos, :dependent => :destroy
end
