collection @result
attributes :id, :name, :description

node(:master_variant_id){|p| p.master.id}