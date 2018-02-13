ActiveAdmin.register Workout do
permit_params :workout, :set
 index do
   selectable_column
   id_column
   column :workout
   column :set
 end
 filter :workout
 filter :set

 action_item :new_workout ,only: :index do
   link_to "Automatically Workout upload", "http://localhost:3000/admin/wokouts/new?view=automatic"
end

form :html => { :enctype => "multipart/form-data"} do |f|
  f.inputs do
    render "movies/form", {workouts: workout,view: params[:view]}
  end

  end
end
