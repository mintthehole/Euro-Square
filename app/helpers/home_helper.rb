module HomeHelper
	def build_cities
		options = {'Select' => ''}
		City.all.each {|st| options = options.merge({st.name => st.name})}
    options
	end

	def build_delivery_cities
		options = {'Select' => ''}
		City.all.each do |st|
			options = options.merge({st.name => st.id}) if st.options.empty?
		end
    options
	end
end

