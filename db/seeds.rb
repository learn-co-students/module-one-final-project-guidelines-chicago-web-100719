equipment_hash = JSON.parse(RestClient.get('https://wger.de/api/v2/equipment'))
equipment_names = equipment_hash["results"].collect { |result| result["name"] }
equipment_names.each { |name| Equipment.create(name: name) }

muscle_group_hash = JSON.parse(RestClient.get('https://wger.de/api/v2/exercisecategory'))
muscle_group_names = muscle_group_hash["results"].collect { |result| result["name"] }
muscle_group_names.each { |name| MuscleGroup.create(name: name) }

Exercise.create(name: "Sitting Calf Raise", description: "Sit on a bench for calf raises and check that the feet are half free and that you can completely stretch the calf muscles down. Pull your calves up, going as far up as you can. At the highest point make a short pause of 1 or 2 seconds and go down.", equipment_id: 2, muscle_group_id: 4)

Exercise.create(name: "Standing Calf Raise", description: "Raise calves as far up as you can while standing straight. At the highest point make a short pause of 1 or 2 seconds and go down.", equipment_id: 7, muscle_group_id: 4)

Exercise.create(name: "Shrug", description: "Take a barbell and stand with a straight body, the arms are hanging freely in front of you. Lift from this position the shoulders as high as you can, but don't bend the arms during the movement. On the highest point, make a short pause of 1 or 2 seconds before returning slowly to the initial position.", equipment_id: 1, muscle_group_id: 7)

Exercise.create(name: "Shoulder Press", description: "Take two dumbbells and bring them up to shoulder height, the palms and the elbows point to the front during the whole exercise. Push the weights up, at the highest point they come near but do not touch each other. Bring the weights slowly down and repeat.", equipment_id: 3, muscle_group_id: 7)

Exercise.create(name: "Deadlift", description: "Stand firmly, with feet wide apart. Stand directly behind the bar which should barely touch your shin, with your feet pointing a bit out. Bend down with a straight back, the knees also pointing somewhat out. Grab the bar with a shoulder wide grip. At the highest point make a slight hollow back and pull the bar back. Hold 1 or 2 seconds in that position. Go back down, making sure the back is not bent.", equipment_id: 1, muscle_group_id: 3)

Exercise.create(name: "Chin Up", description: "Pull up with hand grips reversed.", equipment_id: 8, muscle_group_id: 3)

Exercise.create(name: "Incline Bench Press", description: "Hold two dumbbells or a barbell while laying down on an incline bench. Hold the weights next to the chest (if using dumbbells) or the eyes (if using a barbell) and push up until the arms are stretched. Then slowly let the weight down.", equipment_id: 5, muscle_group_id: 5)

Exercise.create(name: "Fly with Dumbbells", description: "Take two dumbbells and lay back on a bench, make sure the feet are firmly on the ground and your back is not arched. The arms are stretched in front of you, about shoulder wide. Bend the arms a bit and slowly let them down with a half-circle movement to your sides. Without changing the angle of the elbow, bring the dumbbells back up and repeat.", equipment_id: 3, muscle_group_id: 5)


