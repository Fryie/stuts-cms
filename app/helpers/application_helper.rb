module ApplicationHelper
  def has_selected_item_as_child?(top_level_items,current_item) 
     top_level_items.each do |tli| 
       n = matching_node(tli,current_item) 
       return found_selected?(n) if n 
     end 
   end 
   def matching_node(node,item) 
     if node[:id] == item[:id] 
       return node 
     else 
       if node[:children] 
         node[:children].each do |n| 
           matched = n[:id] == item[:id] ? n : matching_node(n,item) 
           return matched 
         end 
       end 
     end 
   end 
   def found_selected?(node) 
     if node.has_key?(:selected) 
       return true 
     else 
       if node[:children] 
         node[:children].each do |i| 
           if i.has_key?(:selected) 
             return true 
           elsif i[:children] 
             found_selected?(i) 
           end 
         end 
       end 
     end 
   end
end
