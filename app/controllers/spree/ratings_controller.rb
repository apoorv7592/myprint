class RatingsController < ApplicationController
  def create
    @rating = Rating.new(params[:rating])
    @suite = Suite.find(params[:rating][:suite_id])

    respond_to do |format|
        if @rating.save
          format.json { render :json => { :avg_rating => @suite.avg_rating } }
        else
          format.json { render :json => @rating.errors, :status => :unprocessable_entity }
        end
    end
  end

  def update
    @rating = Rating.find(params[:id])
    @suite = Suite.find(params[:rating][:suite_id])
    @rating.update_attributes(params[:rating])
                  
    respond_to do |format|
      if @rating.save
        format.json { render :json => { :avg_rating => @suite.avg_rating } }
      else
        format.json { render :json => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end
end