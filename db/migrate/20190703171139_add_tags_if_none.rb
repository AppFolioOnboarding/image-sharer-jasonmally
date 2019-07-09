class AddTagsIfNone < ActiveRecord::Migration[5.2]
  PLACEHOLDER_TAG = 'specialchicken'.freeze
  def up
    extant_tags = execute <<~SQL
      SELECT * FROM tags WHERE name = '#{PLACEHOLDER_TAG}'
    SQL

    if extant_tags.length == 0
      execute <<~SQL
        INSERT INTO tags (name) VALUES ('#{PLACEHOLDER_TAG}')
      SQL
    end

    placeholder_id_object = execute <<~SQL
      SELECT id FROM tags WHERE name='#{PLACEHOLDER_TAG}'
    SQL

    placeholder_id = placeholder_id_object[0]["id"]

    untagged_imgs = execute <<~SQL
      SELECT * FROM images WHERE id NOT IN (SELECT taggable_id FROM taggings)
    SQL

    untagged_imgs.each do |img|
      img_id = img[0]
      execute <<~SQL
        INSERT INTO taggings (tag_id, taggable_type, taggable_id, context) VALUES ('#{placeholder_id}', 'Image', '#{img_id}', 'tags');
      SQL
    end

    execute <<~SQL
      UPDATE tags SET taggings_count = (SELECT COUNT (*) FROM taggings WHERE tag_id = '#{placeholder_id}') WHERE id = '#{placeholder_id}'
    SQL

=begin
    INSERT INTO taggings ()
    untagged_images = SELECT * FROM images WHERE id NOT IN (SELECT taggable_id FROM taggings)
    INSERT INTO tags (name) VALUES ('chicken')
    placeholder_id = SELECT id FROM tags WHERE name = 'chicken'
    untagged_images.each do |img|
      INSERT INTO taggings (tag_id, taggable_type, taggable_id) VALUES (placeholder_id, 'Image', img.id)
    end
=end
  end

  def down
    placeholder_id_object = execute <<~SQL
      SELECT id FROM tags WHERE name = '#{PLACEHOLDER_TAG}'
    SQL

    placeholder_id = placeholder_id_object[0]["id"]

    execute <<~SQL
      DELETE FROM taggings WHERE tag_id = '#{placeholder_id}'
    SQL

    execute <<~SQL
      DELETE FROM tags WHERE name = '#{PLACEHOLDER_TAG}'
    SQL
    
  end
end
