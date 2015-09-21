class Concurso < ActiveRecord::Base
  belongs_to :administrador
  has_many :videos, :dependent => :destroy

  def date_validation
    if self[:fechafin] < self[:fechaini]
      errors[:fechafin] << "La fecha final no puede ser mayor a la fecha inicial"
      return false
    else
      return true
    end
  end
  validates :nombre, presence: true,length: { maximum: 30 }
  validates :banner, presence: true,length: { maximum: 60 }
  validates :url, presence: true, format: { without: /\s/,message: "debe ir sin espacio, max 10" },uniqueness: true,length: { maximum: 10 }
  validates :premio, presence: true
  validate :date_validation

end
