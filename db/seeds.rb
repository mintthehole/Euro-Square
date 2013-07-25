# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
		['Agartala','Agra','Ahmedabad','Ahmednagar','Aizawl','Ajmer','Akola','Aligarh',
			'Allahabad','Alwar','Ambattur','Ambernath','Amravati','Amritsar','Anantapur',
			'Arrah','Asansol','Aurangabad','Avadi','Bally','Bangalore','Baranagar','Barasat',
			'Bardhaman','Bareilly','Bathinda','Begusarai','Belgaum','Bellary','Bhagalpur','Bharatpur',
			'Bhatpara','Bhavnagar','Bhilai','Bhilwara','Bhiwandi','Bhopal','Bhubaneswar','Bihar Sharif','Bijapur',
			'Bikaner','Bilaspur','Bokaro','Brahmapur','Bulandshahr','Chandigarh','Chandrapur','Chennai','Coimbatore','Cuttack','Darbhanga','Davanagere','Dehradun','Delhi','Dewas','Dhanbad','Dhule','Durg','Durgapur','Ernakulam','Etawah','Faridabad','Farrukhabad','Firozabad','Gandhidham','Gaya','Ghaziabad','Gopalpur','Gorakhpur','Gulbarga','Guntur','Gurgaon','Guwahati','Gwalior','Hapur','Haridwar','Hisar','Howrah','Hubballi-Dharwad','Hyderabad','Ichalkaranji','Imphal','Indore','Jabalpur','Jaipur','Jalandhar','Jalgaon','Jalna','Jammu','Jamnagar','Jamshedpur','Jhansi','Jodhpur','Junagadh','Kadapa','Kakinada','Kalyan-Dombivali','Kamarhati','Kanpur','Karawal Nagar','Karimnagar','Karnal','Katihar','Kirari Suleman Nagar','Kochi (Cochin)','Kolhapur','Kolkata','Kollam (Quilon)','Korba','Kota','Kozhikode (Calicut)','Kulti','Kurnool','Latur','Loni','Lucknow','Ludhiana','Madurai','Maheshtala','Malegaon','Mangalore','Mango','Mathura','Mau','Meerut','Mira-Bhayandar','Mirzapur','Moradabad','Mumbai','Muzaffarnagar','Muzaffarpur','Mysore','Nagercoil','Nagpur','Nanded','Nashik','Navi Mumbai','Nellore','New Delhi','Nizamabad','Noida','North Dumdum','Ozhukarai','Pali','Panihati','Panipat','Parbhani','Patiala','Patna','Pimpri-Chinchwad','Puducherry','Pune','Purnia','Raichur','Raipur','Rajahmundry','Rajkot','Rajpur Sonarpur','Ramagundam','Rampur','Ranchi','Ratlam','Rewa','Rohtak','Rourkela','Sagar','Saharanpur','Salem','Sangli-Miraj & Kupwad','Satna','Shahjahanpur','Shivamogga (Shimoga)','Sikar','Siliguri','Solapur','Sonipat','South Dumdum','Sri Ganganagar','Srinagar','Surat','Thane','Thanjavur','Thoothukudi','Thrissur','Tiruchirappalli','Tirunelveli','Tirupati','Tirupur','Tiruvottiyur','Trivandrum (Thiruvananthapuram)','Tumkur','Udaipur','Ujjain','Ulhasnagar','Vadodara','Varanasi','Vasai-Virar','Vijayawada','Visakhapatnam','Vizianagaram','Warangal'].each do |city|
				City.create(:name => city)
			end

