class CreateAdministradors < ActiveRecord::Migration
  def change
    create_table :administradors do |t|
      t.text :nombres
      t.text :apellidos
      t.text :correo
      t.text :empresa
      t.text :usuario
      t.text :password

      t.timestamps
    end
  end
end
