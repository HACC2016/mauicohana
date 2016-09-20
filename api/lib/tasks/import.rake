require 'net/http'
require 'csv'

namespace :import do

 task :contacts => :environment do
  Contact.all.destroy_all
  csv_file = Rails.root.join('lib', 'assets', 'contacts.csv')
  CSV.foreach(csv_file, :headers => true, :encoding => 'windows-1251:utf-8') do |row|
    params = row.to_hash.symbolize_keys
    company_id = Company.find_by(external_id:params[:company_external_id].to_s).try(:id)
    # company_id = Company.last.id
    params.delete(:company_external_id)
    contact = Contact.create(params.merge(company_id: company_id))
  end
 end

 task :companies => :environment do
  Categorization.all.destroy_all
  Category.all.destroy_all
  Company.all.destroy_all
  csv_file = Rails.root.join('lib', 'assets', 'new_company.csv')
  CSV.foreach(csv_file, :headers => true, :encoding => 'windows-1251:utf-8') do |row|
    params = row.to_hash.symbolize_keys
    params = params.reject{|k,v| !Company.attribute_names.include?(k.to_s) }
    company = Company.create(params)

    next if params[:products].nil?
    begin
      product_categories = JSON.parse(params[:products])
    rescue JSON::ParserError
      next
    end
    product_categories.each do |product_category|
      category_name = product_category.first
      category = Category.find_or_create_by(name:category_name)

      company.categorizations.find_or_create_by(category_id:category.id)
      product_category.last.each do |product_name|
        sub_category = Category.find_or_create_by(name:product_name, parent_id: category.id)
        company.categorizations.find_or_create_by(category_id:sub_category.id)
      end
    end
  end
 end

 task :company_clean => :environment do
  headers = %w| external_id	name	active	omit	needs_update	needs_update_sent	updated	address	city	state	zip	island	phone_1	phone_2	fax_pre	fax	website	email	certified	country	established_year	products	products_info	notes_1	notes_2	employ	annual_volume	exporter	export_sales	title_1	salutation_1	salutation_2	tob_grower	tob_distributor	tob_wholesaler	tob_processor	tob_manufacturer	tob_retailer	tob_other	tob_otherdesc	serv_mailorder	serv_delivery	serv_packing	serv_growing	serv_labeling	serv_bulk	serv_retail	serv_other	serv_otherdesc	mark_hawaii	mark_guam	mark_china	mark_australia	mark_usmain	mark_japan	mark_hongkong	mark_europe	mark_canada	mark_korea	mark_seasia	mark_other	mark_otherdesc	ffruit_bananas	ffruit_citrus	ffruit_papaya	ffruit_avocado	ffruit_exotictrop	ffruit_pineapple	ffruit_other	ffruit_otherdesc	fruitpuree_papaya	fruitpuree_guava	fruitpuree_other	fruitpuree_otherdesc	fveg_cabbages	fveg_otherleafy	fveg_ginger	fveg_onions	fveg_taro	fveg_otherroot	fveg_herbs	fveg_other	fveg_otherdesc	macnut_plainroasted	macnut_candiedchoco	macnut_other	macnut_otherdesc	bsfood_cookies	bsfood_crackers	bsfood_candies	bsfood_chips	bsfood_driedfruits	bsfood_crackseed	bsfood_other	bsfood_otherdesc	cond_sauces	cond_syrups	cond_spreads	cond_jamsjellies	cond_dressing	cond_seasonmix	cond_soups	cond_presfruits	cond_pickveg	cond_other	cond_otherdesc	coffee_bigislandexkona	coffee_kona	coffee_molokai	coffee_maui	coffee_kauai	coffee_oahu	bev_tea	bev_drinkmix	bev_concentrates	bev_juices	bev_alcoholic	bev_other	bev_otherdesc	meat_beef	meat_pork	meat_poultry	meat_driedsmoke	meat_other	meat_otherdesc	dairy_icecream	dairy_milk	dairy_other	dairy_otherdesc	oseafood_fresh	oseafood_frozen	oseafood_processed	oseafood_other	oseafood_otherdesc	aqua_fresh	aqua_frozen	aqua_processed	aqua_other	aqua_otherdesc	health_prod	health_proddesc	mfg_other	mfg_otherdesc	floral_anthuriums	floral_anthuriumsdesc	floral_other	floral_otherdesc	floral_foliage	floral_foliagedesc	floral_leis	floral_leisdesc	orch_dendrobiums	orch_oncidium	orch_vandas	orch_phalaenopsis	orch_cymbidium	orch_other	orch_otherdesc	trop_heliconias	trop_birdparadise	trop_gingers	trop_other	trop_otherdesc	protea_kings	protea_queens	protea_banksia	protea_minks	protea_pincushions	protea_duchess	protea_other	protea_otherdesc	potplant_dracaena	potplant_palms	potplant_bromeliads	potplant_ferns	potplant_ficus	potplant_succulents	potplant_bonsai	potplant_other	potplant_otherdesc	potorch_denbrobiums	potorch_phalaenopsis	potorch_cattleya	potorch_oncidium	potorch_hybrids	potorch_species	potorch_other	potorch_otherdesc	potflower_chrysanthemums	potflower_poinsettias	potflower_gesneriads	potflower_bulbs	potflower_anthuriums	potflower_hibiscus	potflower_bromeliads	potflower_other	potflower_otherdesc	landplants_palms	landplants_shrubs	landplants_bedding	landplants_groundcover	landplants_specimentree	landplants_vines	landplants_flowerplants	landplants_flowertrees	landplants_other	landplants_otherdesc	propag_seeds	propag_cuttings	propag_liners	propag_plugs	propag_micropropagative	propag_other	propag_otherdesc |
  csv_file = Rails.root.join('lib', 'assets', 'companies2.csv')
  CSV.open("new_company.csv", "wb") do |csv|
    csv << headers
    current_row = nil
    CSV.foreach(csv_file, :headers => true, :encoding => 'windows-1251:utf-8') do |row|
      puts row['external_id']
      str = row['external_id'].split(':').first
      if row['external_id'].to_i.to_s == row['external_id']
        csv << current_row if current_row
        current_row = row.to_a.map{|k,v| v }
        current_row[21] ||= ''
        category, products = current_row[21].split(':')
        next if products.nil?
        products = products.split(',').collect{|x| x.strip || x }
        current_row[21] = Hash[category, products].to_json
      elsif row['external_id'][0] == ';' || row['external_id'].split(':').count == 1 || str != str.upcase
        current_row = current_row[0..21] + row.to_a.map{|k,v| v }
      else
        current_row[21] ||= ''
        cat_prods = JSON.parse(current_row[21])
        category, products = row.to_a.map{|k,v| v }.compact.join(',').split(':')
        next if products.nil?
        products = products.split(',').collect{|x| x.strip || x }
        cat_prods[category] = products
        current_row[21] = cat_prods.to_json
      end
    end
    csv << current_row if current_row
  end
 end

end
