collection @discovers
attributes :name
node(:img_url){|d| d.avatar.url}
node(:url){|d| discover_path(d)}