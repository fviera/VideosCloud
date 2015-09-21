class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :nombres
      t.text :apellidos
      t.text :correo
      t.text :fecha
      t.text :estado
      t.text :mensaje
      t.text :archivo
      t.text :archivoconvertido
      t.text :mensaje
      t.datetime :fechainiconversion
      t.datetime :fechafinconversion

      t.timestamps
    end
  end
end
