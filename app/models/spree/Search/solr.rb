module Spree::Search
  class Solr
    attr_accessor :current_user
    attr_accessor :current_currency

    def initialize(params)
      @search_result = Spree::Product.solr_search do
        fulltext params
      end
    end
    
    def retrieve_products
      @search_result.results
    end
  end
end