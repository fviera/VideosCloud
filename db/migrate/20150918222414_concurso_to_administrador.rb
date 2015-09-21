class ConcursoToAdministrador < ActiveRecord::Migration
  def change
    add_reference :concursos, :administrador, index: true,  foreign_key: true
  end
end
