class JobchecksController < ApplicationController

 def top
 end

 def manufacturer_sales

   career = 0
   age = 0
   career_age = 0
   manufacturer_sales = 0

   if current_user.career == '有形営業'
     career = 0.95
   end

   if current_user.age == 25
  	 age = 0.92
   end

   if current_user.career_age == 3
     career_age = 0.9
   end

   manufacturer_sales = career * age * career_age *100
   @manufacturer_sales = manufacturer_sales

 end

end
