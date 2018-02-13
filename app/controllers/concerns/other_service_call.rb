 class OtherServiceCall
   def api_call(workout)
     @workout = workout.split(' ').join('_')

     uri = URI("http://wger.de/api/v2/workout/?w=#{@workout}&apikey=bb78fc15707317ae69c4a50d7f5051896703fba7")
     a = Net::HTTP.get(uri)
     b = JSON.parse(a)

     if b["Response"] == "True"
       workout = b["Workout"]
       set = b["Set"]
