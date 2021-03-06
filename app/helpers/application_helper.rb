module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, "#", class: "add_field", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def current_game
    Game.all.order(:year).last
  end

  def keys_with(hash, key_to_test)
    hash.each do |k, v|
      if v != key_to_test
        hash.delete(k)
      end
    end
    hash.keys
  end
end
