module Spree
    module PogoHelper
        def get_banner(category, position)
            if category && position
                b = Pogo.where(category: category, position: position).first
            else
                "Banner Category or position not supplied"
            end
        end
    end
end