if defined?(WillPaginate)
  module WillPaginate
    module ActiveRecord
      module RelationMethods
        alias_method :per, :per_page
        alias_method :num_pages, :total_pages
        alias_method :total_count, :count
        def last_page?
          last_page = current_page==total_pages
          last_page
        end
      end
    end
  end
end