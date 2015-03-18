module Spree
	module SuitesHelper
		def vlm_prc_str(prc)
			open_ended = /\(?[0-9]+\+\)?/			
			if open_ended =~ prc.range
				prc.range.to_s + ' cards for ' + prc.amount.to_s
			else
				r = to_rng(prc.range)
				r.last.to_s+' cards for ' + prc.amount.to_s
			end
		end

		def vlm_prc_val(prc)
			
		end
	end
end