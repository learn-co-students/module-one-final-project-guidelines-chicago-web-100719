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

Exercise.create(name: "Pull Up", description: "Pull up with hand grips forward.", equipment_id: 8, muscle_group_id: 3)

Exercise.create(name: "Incline Bench Press", description: "Hold two dumbbells or a barbell while laying down on an incline bench. Hold the weights next to the chest (if using dumbbells) or the eyes (if using a barbell) and push up until the arms are stretched. Then slowly let the weight down.", equipment_id: 5, muscle_group_id: 5)

Exercise.create(name: "Fly with Dumbbells", description: "Take two dumbbells and lay back on a bench, make sure the feet are firmly on the ground and your back is not arched. The arms are stretched in front of you, about shoulder wide. Bend the arms a bit and slowly let them down with a half-circle movement to your sides. Without changing the angle of the elbow, bring the dumbbells back up and repeat.", equipment_id: 3, muscle_group_id: 5)

Exercise.create(name: "Axe Hold", description: "Grab dumbbells and extend arms to side and hold as long as you can.", equipment_id: 3, muscle_group_id: 2)

Exercise.create(name: "Barbell Triceps Extension", description: "Position barbell overhead with narrow overhand grip. Lower forearm behind upper arm with elbows remaining overhead. Extend forearm overhead. Lower and repeat.", equipment_id: 1, muscle_group_id: 2)

Exercise.create(name: "Bench Dip", description: "Position two benches so that you can hold onto one with your hands and are just able to reach the other with your feet. With your elbows facing back, bend them as much as you can to lower your body down. Push yourself up.", equipment_id: 2, muscle_group_id: 2)

Exercise.create(name: "SZ-Bar Skullcrusher", description: "Hold the SZ-bar and lay down on a flat bench in such a way that around 1/4 of your head is over the edge. Stretch your arms with the bar and bend them so that the bar is lowered. Just before it touches your forehead, push it up.", equipment_id: 10, muscle_group_id: 2)

Exercise.create(name: "Wall Squat", description: "Stand with your back leaning against a wall. Slowly slide down the wall while moving your feet away from it, until your thighs are parallel to the ground. Cross your arms in front of your chest and hold this position for 30 seconds." , equipment_id: 7, muscle_group_id: 6)

Exercise.create(name: "Kettlebell Swing", description: "Hold the kettlebell securely in both hands. Keep your back flat throughout the move, avoiding any rounding of the spine.Keeping your knees soft', hinge your hips backwards, letting the kettlebell swing between your knees.", equipment_id: 6, muscle_group_id: 6)

Exercise.create(name: "Barbell Lunge", description: "Put barbell on the back of your shoulders. Stand upright, then take the first step forward. Step should bring you forward so that your supporting legs knee can touch the floor. Then stand back up and repeat with the other leg.", equipment_id: 1, muscle_group_id: 6)

Exercise.create(name: "Leg Raise", description: "Laying down on a gym mat, hold your legs straight and lift them till they make an angle of about 45°. Pause 1 sec. and go slowly down to the initial position.", equipment_id: 4, muscle_group_id: 1)

Exercise.create(name: "Swiss Ball Situp", description: "Sit on the ball with the middle of your back supported by the top of the ball. Your feet should be parallel and shoulder width apart and your knees bent to about 90 degrees. Place you hnds behind your back and perform sit-up motion.", equipment_id: 9, muscle_group_id: 1)

Exercise.create(name: "Russian Twist", description: "Sit with your torso leaning back at a 45-degree angle, knees bent, and your feet either on the floor or elevated a few inches. In most variations you hold  From that starting position you rotate your shoulders to the left and right.", equipment_id: 3, muscle_group_id: 1)