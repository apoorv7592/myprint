module Spree
	class EntriesController < Spree::HomeController

		def create
			@entry = Entry.new(entry_params)
			if @entry.save 
				if params[:images]
					params[:images].each do |img|
						@entry.entry_attachements.create(image: img)
					end
				end
				respond_to do |format|
					format.html{
						redirect_to @entry, notice: 'Entry successfully submited'
					}
				end
			else
				respond_to do |format|
					format.html{
						redirect_to :back, notice: 'Entry successfully submited'
					}
				end
			end
		end

		def show

		end

		private
			def entry_params
				params.require(:entry).permit(:title, :images)
			end
	end
end