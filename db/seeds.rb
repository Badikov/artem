# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#a = Array.new
#a=[1, 2, 3, 4,5,6,7,8,9,10]
#a.each do|x| 
#  puts x
#  @release = Release.find_by_id(x)
#  puts @release.data
#  @release.destroy
#end
 


#file = File.open("avto.txt")
#  file.each do |line|
#    id, name = line.chop.split(",")
#    puts name
#    Marka.create(name: name)
#  end
#file.close

#file = File.open("mark.txt")
#  file.each do |line|
#    id, name = line.chop.split(",")
#    puts name
#    Model.create(name: name, marka_id: id)
#  end
#file.close

#file = File.open("typ_dvigatela.txt")
#  file.each do |line|
#    name = line.chop
#    puts name
#    Engine.create(typ: name)
#  end
#file.close

#file = File.open("typ_kuzova.txt")
#  file.each do |line|
#    name = line.chop
#    puts name
#    Body.create(typ: name)
#  end
#file.close
=begin
file = File.open("color.txt")
  file.each do |line|
    name = line.chop
    puts name
    Color.create(name: name)
  end
file.close

file = File.open("size_of_engine.txt")
  file.each do |line|
    name = line.chop
    puts name
    Capacity.create(volume: name)
  end
file.close

file = File.open("rul.txt")
  file.each do |line|
    name = line.chop
    puts name
    Steer.create(typ: name)
  end
file.close

file = File.open("god.txt")
  file.each do |line|
    name = line.chop
    puts name
    Release.create(data: name)
  end
file.close


file = File.open("privod.txt")
  file.each do |line|
    name = line.chop
    puts name
    Drive.create(name: name)
  end
file.close

file = File.open("sostoyanie.txt")
  file.each do |line|
    name = line.chop
    puts name
    State.create(name: name)
  end
file.close

file = File.open("owner.txt")
  file.each do |line|
    name = line.chop
    puts name
    Owner.create(name: name)
  end
file.close

file = File.open("probeg.txt")
  file.each do |line|
    name = line.chop
    puts name
    Odometer.create(kilometer: name)
  end
file.close

file = File.open("gearbox.txt")
  file.each do |line|
    name = line.chop
    puts name
    Gearbox.create(name: name)
  end
file.close
=end