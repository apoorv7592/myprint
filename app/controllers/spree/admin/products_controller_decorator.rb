Spree::Admin::ProductsController.class_eval do
      
      def import
        if Spree::Product.import(params[:file])
	       redirect_to action: 'index', notice: "products imported."
	   else
	   		redirect_to action: 'index', notice: 'some error occured'
	   	end
      end

      def bulk_upload
      end
end
