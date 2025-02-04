require "sinatra"
require "sinatra/reloader"

get("/howdy") do 
  erb(:hello)
end 

get("/goodbye") do 
  erb(:bye)
end 


###SQUARE 
get("/square/new") do 
  erb(:new_square_calc)
end 

get("/square/results") do 
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results) 
end 



### SQUARE ROOT
get("/square_root/new") do 
  erb(:new_squre_root_calc)
end 

get("/square_root/results") do 
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5

  erb(:square_root_results) 
end 




###PAYMENT
get("/payment/new") do 
  erb(:payment)
end

get("/payment/results") do   
  @apr = ((params.fetch("APR_user").to_f) / 100 / 12 ).round(4)   
  
  @years = (params.fetch("years_user")).to_i * 12 

  @principal = (params.fetch("principal_user")).to_f


  @formatted_apr = @apr.to_fs(:percentage, { :precision => 0 })

  @formatted_principal = @principal.to_fs(:currency)



  @numerator = @apr * @principal 

  @denominator = 1 - (1 + @apr) ** -@years 

  @present_value = @numerator / @denominator 

  @formatted_present_value = @present_value.to_fs(:currency)
  
  erb(:payment_results) 
end 


###RANDOM FORM
get("/random/new") do 
  erb(:random)
end

get("/random/results") do 
  @min = params[:min].to_i
  @max = params[:max].to_i 

  @random_number = rand(@min..@max)

  erb(:random_results)
end 
