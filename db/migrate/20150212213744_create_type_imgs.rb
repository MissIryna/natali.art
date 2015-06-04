class CreateTypeImgs < ActiveRecord::Migration
  def change
    create_table :type_imgs do |t|
      t.string :type

      t.timestamps
    end
  end
end
