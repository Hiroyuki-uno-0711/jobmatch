class JobchecksController < ApplicationController

 def top
 end

 def manufacturer_sales

   manufacturer_sales = 0

   case current_user.career
   when '一般事務', '人事'
     career = 0.4
   end

   case current_user.age
   when 25, 26
  	 age = 0.92
   end

   case current_user.career_age
   when 3, 4
     career_age = 0.9
   end

   manufacturer_sales = career * age * career_age * 100
   @manufacturer_sales = manufacturer_sales
 end

end
