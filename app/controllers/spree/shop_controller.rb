module Spree

    class ShopController < Spree::HomeController
        
        def wedding
            par = params[:id]
            if par=='shop-all'
                @search = Suite.search(params[:search], params[:sub_cat_id], params[:designer],
                    params[:color_id], params[:trim_id], params[:dimension_id],
                    params[:created_at], params[:like_no], params[:avg_rating], params[:price], 'Wedding Invitations', params[:page])
            else
                @subcat = SubCategory.friendly.find(params[:id])
                sub_cat_id = @subcat.id
                #search(q,sub_cat_id,designer, color_id, trim_id,dimension_id, created_at,like_no,avg_rating,price )
                @search = Suite.search(params[:search], sub_cat_id, params[:designer],
                    params[:color_id], params[:trim_id], params[:dimension_id],
                    params[:created_at], params[:like_no], params[:avg_rating], params[:price], params[:category_id],params[:page])

            end
            @scsuite = @search.results

        end
        def greeting
            par = params[:id]
            if par=='shop-all'
                @search = Suite.search(params[:search], params[:sub_cat_id], params[:designer],
                    params[:color_id], params[:trim_id], params[:dimension_id],
                    params[:created_at], params[:like_no], params[:avg_rating], params[:price], 'Other Invitations', params[:page])
            else
                @subcat = SubCategory.friendly.find(params[:id])
                sub_cat_id = @subcat.id
                #search(q,sub_cat_id,designer, color_id, trim_id,dimension_id, created_at,like_no,avg_rating,price )
                @search = Suite.search(params[:search], sub_cat_id, params[:designer],
                    params[:color_id], params[:trim_id], params[:dimension_id],
                    params[:created_at], params[:like_no], params[:avg_rating], params[:price], params[:category_id],params[:page] )
            end            
            @scsuite = @search.results
        end
        def otherinvites
            par = params[:id]
            if par=='shop-all'
                @search = Suite.search(params[:search], params[:sub_cat_id], params[:designer],
                    params[:color_id], params[:trim_id], params[:dimension_id],
                    params[:created_at], params[:like_no], params[:avg_rating], params[:price], 'Other Invitations', params[:page])
            else
                @subcat = SubCategory.friendly.find(params[:id])
                sub_cat_id = @subcat.id
                #search(q,sub_cat_id,designer, color_id, trim_id,dimension_id, created_at,like_no,avg_rating,price )
                @search = Suite.search(params[:search], sub_cat_id, params[:designer],
                    params[:color_id], params[:trim_id], params[:dimension_id],
                    params[:created_at], params[:like_no], params[:avg_rating], params[:price], params[:category_id], params[:page])
            end
            @scsuite = @search.results
        end

    end
end


