Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("directors/eldest", { :controller => "directors", :action => "eldest" })
  get("/directors/youngest", { :controller => "directors", :action => "youngest" })
  get("/directors/:the_id", { :controller => "directors", :action => "show" })


  get("/movies", { :controller => "movies", :action => "index"})
  get("/movies/:the_id", { :controller => "movies", :action => "show" })

  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:the_id", { :controller => "actors", :action => "show" })
end
