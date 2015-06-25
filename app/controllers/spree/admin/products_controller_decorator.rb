Spree::Admin::ProductsController.class_eval do
      
      def import
	      Spree::Product.import(params[:file])
	      redirect_to action: 'index', notice: "products imported."
      end

      def bulk_upload
      end
end
