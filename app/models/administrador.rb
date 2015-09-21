class Administrador < ActiveRecord::Base
  has_many :concursos, :dependent => :destroy
  include ActiveModel::Validations

  class CorreoValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, (options[:message] || "no es valido ej. xxx@yyy.zzz") unless
          value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    end
  end
  validates :nombres, presence: true,length: { maximum: 30 }
  validates :apellidos, presence: true,length: { maximum: 100 }
  validates :correo, presence: true, correo: true
  validates :usuario, presence: true, uniqueness: true
  validates :password, presence: true
  #validates :password_confirmation, presence: true
  attr_accessor :password_adicional

end
