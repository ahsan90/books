# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



t = Book.new
t.title = "Year 12 Biology Revision Notes Module 1"
t.body = "Year 11 -12 HSC Biology students. Students can use this as study material and for revision.  This document contains:
Crucial Information to Maximise Performance
Module 1: Maintaining a balance
Specificity of Enzymatic Function in organisms
Maintenance of internal conditions especially temperature
Transportation of nutrients and gases in organisms
Regulation of gas concentrations, water and waste products of metabolism Regulation of salt levels for estuarine organisms
This document only contains Module 1, Modules 2 and 3 are in separate documents.
Created By B.C, ATAR: 99.40 The document contains 9 pages."
t.atar = 99.4
t.price = 6.99
t.remote_file_url = 'https://dl.dropboxusercontent.com/s/4enof3dcnktnct7/1_BJ_20120414_Biology_Notes_Module1.pdf?dl=1&token_hash=AAFupTu_UaTXRzCHgXnA075GfMAA1o3JY8khZCRRMqWLww'
t.remote_display_url = 'https://dl.dropboxusercontent.com/s/3co70tira6g20d3/Cover1_flatten-001-001.jpg?dl=1&token_hash=AAGIX1VsakXBsfU0lw2pJKsTBuBNgPabCd2EIJ5R8fu9vg'
t.category = Category.find_by_title('HSC')
t.save