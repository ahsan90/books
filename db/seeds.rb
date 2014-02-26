# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'
require 'open-uri'

open(ENV['SEEDING_FILE'], 'r:ISO-8859-1') do |f|
  rows = CSV.parse(f.read, headers: true)
  rows.each_with_index do |row, index|
    puts "Starting row #{index+1}/#{rows.length}"
    b = Book.where(title: row['title']).first_or_create
    b.body = row['body']
    b.atar = row['atar']
    b.price       = row['price']
    b.remote_file_url = row['file']
    b.remote_display_url = row['display']
    b.remote_preview_url = row['preview']
    b.category    = Category.where(title: row['category']).first_or_create
    if b.save
      puts "Successfully saved #{b.title}"
    else
      puts "Error saving #{b.title} (handle manually later)"
    end
  end
end
#t.remote_file_url = 'https://dl.dropboxusercontent.com/s/4enof3dcnktnct7/1_BJ_20120414_Biology_Notes_Module1.pdf?dl=1&token_hash=AAFupTu_UaTXRzCHgXnA075GfMAA1o3JY8khZCRRMqWLww'
#t.remote_display_url = 'https://dl.dropboxusercontent.com/s/3co70tira6g20d3/Cover1_flatten-001-001.jpg?dl=1&token_hash=AAGIX1VsakXBsfU0lw2pJKsTBuBNgPabCd2EIJ5R8fu9vg'
#t.category = Category.find_by_title('HSC')
#t.save