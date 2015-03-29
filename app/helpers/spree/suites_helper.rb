module Spree
	module SuitesHelper
		def vlm_prc_str(prc)
			open_ended = /\(?[0-9]+\+\)?/			
			if open_ended =~ prc.range
				prc.range.to_s + ' cards for ' + prc.amount.to_s
			else
				r = to_rng(prc.range)
				r.last.to_s+' cards for---Rs. ' + prc.amount.to_s
			end
		end

	end
end