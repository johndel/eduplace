namespace :parse do
  desc "Parse and create all education places from http://www.eoppep.gr/index.php/el/search-for/learning-institutions/kdvm_search_page"
  task all: :environment do
    agent = Mechanize.new
    page = agent.get("http://domes.eoppep.gr/")
    cities = page.at("#countyId").children
    city_names = []
    city_values = []
    cities.each do |city_el|
      city_names << city_el.children.text
      city_values << city_el.attributes.first[1].value rescue nil
    end
    city_names.reject! { |c| c.empty? }
    city_values.reject! { |c| c.empty? }

    city_values.each do |city_value|
      page2 = agent.get("http://domes.eoppep.gr/home/SearchResult?countyId=#{city_value}")
      page2.search(".results > div").each do |front|

        all_in_one = front.children[3].children[3].children[0].text.strip.split(", ") rescue nil
        phone_fax = front.children[3].children[3].children[2].text.strip.split(", ") rescue nil

        edutype_name = front.children[1].children.children.last.text.strip rescue nil
        place_edutype = Edutype.where(name: edutype_name).first_or_create if edutype_name

        city_name = all_in_one[1].gsub("Πόλη : ", "").strip rescue nil
        place_city = City.where(name: city_name).first_or_create if edutype_name

        county_name = all_in_one[0].gsub("Νομός : ", "").strip rescue nil
        place_county = County.where(name: county_name).first_or_create if county_name

        place_postal_code = all_in_one[3].gsub("T.K. : ", "").strip.to_i rescue nil
        place_address = all_in_one[2].gsub("Διεύθυνση : ", "") rescue nil

        amea_boolean = front.children[3].children[3].children[5].children[1].text rescue nil
        amea = amea_boolean == "NAI" ? true : false

        place_name = front.children[3].children[1].children[2].text.strip rescue nil
        place_title = front.children[3].children[1].children[6].text.strip rescue nil
        place_site = front.children[3].children[1].children[10].text.strip rescue nil
        place_phone = phone_fax[0].gsub("Τηλ : ", "").strip rescue nil
        place_fax = phone_fax[1].gsub("FAX : ", "").strip rescue nil
        place_amea = amea
        place_trainee_capacity = front.children[3].children[3].children[5].children[3].children[1].text.to_i rescue 0

        place_permission_code = front.children[1].children.children.children.text.strip
        # if Place.where(permission_code: place_permission_code).first.nil?
          Place.create(permission_code: place_permission_code,
                  edutype_id: place_edutype.id,
                  county_id: place_county.id,
                  city_id: place_city.id,
                  name: place_name,
                  title: place_title,
                  site: place_site,
                  address: place_address,
                  postal_code: place_postal_code,
                  phone: place_phone,
                  fax: place_fax,
                  amea: place_amea,
                  trainee_capacity: place_trainee_capacity)
        # end
      end
    end
  end
end