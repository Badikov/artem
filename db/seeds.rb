markas = []
    f = File.join(Rails.root, 'public','Модели', 'markas.txt')
    puts f
    file = File.open(f)
      file.each do |line|
        markas = line.gsub("\"", "")
      end
    file.close
    mark = []
    markas.split("},{").each do |h|
      hash = {}
      item = h.gsub("[{","").gsub("}]","")
      a,b = item.split(",")
      k,v = a.split(":")
      hash[:id] = v
      k,v = b.split(":")
      hash[:name] = v
      mark << hash
    end
# 
################################################
# add items to markas table
i=1

@markas = Marka.select("id,name")
@markas.each do |mar|
  mark.each do |m|
    if mar.name.downcase == m[:name].downcase
      puts i.to_s + " " + mar.name + "," +mar.id.to_s
      mar.update(name2: m[:name])
      i += 1
    end
  end
end
#########################################################

#
# @markas = Marka.select("id,name")
# @markas.each do |mar|
#   mark.each do |m|
#     if mar.name.downcase == m[:name].downcase
#       puts mar.name + "," +mar.id.to_s
#       path = File.join(Rails.root, 'public','Модели', "#{m[:id]}.txt")
#       puts path
#       models = ""
#         file = File.open(path)
#           file.each do |line|
#             models = line.gsub("\"", "")
#           end
#         file.close
#         mod = []
#         models.split("},{").each do |h|
#           hash = {}
#           item = h.gsub("[{","").gsub("}]","")
#           a,b = item.split(",")
#           k,v = b.split(":")
#           hash[:name] = v
#           mod << hash
#         end


#         f = File.join(Rails.root, 'public','Модели', 'out.txt')
#         puts f
#         file = File.open(f)
#           file.each do |line|
#             id, name, mod_id, mod_ = line.chomp("\n").split(",")
#             if id == mar.id.to_s
#               mod.map { |k| 
#                 v = k[:name] 
#                 puts mod_
#                 if mod_ == v
#                   # myfile = File.join(Rails.root, 'public','Модели', 'file.txt')
#                   # open(myfile, 'a') do |f|
#                   #   f << id + "," + name + "," + mod_id + "," + mod_ + "," + v + "\n"
#                   # end
#                   find = Model.find_by_id mod_id
#                   find.update(name2: v)

#                 end
#               }
#             end
#           end
#         file.close

#     end
#   end
# end


# @markas = Marka.select("id,name")
# # myfile = File.join(Rails.root, 'public','Модели', 'out.txt')
# # open(myfile, 'w') do |f|
#     @markas.each do |t|

#       mark.each do |m|
#         if t.name.downcase == m[:name].downcase
#           puts t.name
#           @mods = Model.where(marka_id: t.id)
#           models = []
#           path = File.join(Rails.root, 'public','Модели', "#{m[:id]}.txt")
#           puts path
#           file = File.open(path)
#           file.each do |line|
#             models = line.gsub("\"", "")
#           end
#           file.close
#           mod = []
#           models.split("},{").each do |h|
#             hash = {}
#             item = h.gsub("[{","").gsub("}]","")
#             a,b = item.split(",")
            
#             k,v = b.split(":")
#             hash[:name] = v
#             mod << hash
#           end

#           # @mods.each do |z|
#           #   puts path
#           # end
          
#         end
#       end
      
#     end
# # end
# myfile = File.join(Rails.root, 'public','Модели', 'out.txt')
# open(myfile, 'w') do |f|
#   @markas = Model.select("marka_id,id,name")
#   @markas.each do |t|
#     @marka = Marka.where(id: t.marka_id)
#     f << t.marka_id.to_s + ","  + @marka[0].name + "," + t.id.to_s + "," + t.name + "\n"
#     # puts t.id, t.name , models.id , models.name
#     # puts t.inspect
#   end
# end
# puts @markas.size

