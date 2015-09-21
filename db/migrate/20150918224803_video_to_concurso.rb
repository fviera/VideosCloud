class VideoToConcurso < ActiveRecord::Migration
  def change
    add_reference :videos, :concurso, index: true,  foreign_key: true
  end
end
