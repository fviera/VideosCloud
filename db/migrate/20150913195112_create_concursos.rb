class CreateConcursos < ActiveRecord::Migration
  def change
    create_table :concursos do |t|
      t.text :nombre
      t.text :banner
      t.text :url
      t.datetime :fechaini
      t.datetime :fechafin
      t.text :premio

      t.timestamps
    end
  end
end
