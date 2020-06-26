
gift = <<COOL
For my ((a family member))'s ((an event)) present about ((a number)) years ago,
I got him a ((gift:a noun)).   Not a ((an adjective)) ((gift)) or a loud one or
even a ((an adjective)) ((gift)) that runs around chasing its ((a body part))
and drooling on the ((a noun)).  I got them a ((a proper noun)), bred in China
thousands of years ago to be the ((a plural noun)) of the royal family.  We
named it ((a proper name)).
COOL

lunch = <<COOL
I ((a verb, past tense)) to the sandwich shop across the street for lunch
yesterday. I go there at least ((a number)) times a week. They have the best
Philly Cheesesteak, full of ((a plural noun)) and ((a plural noun)) and gooey,
stringy ((a noun)). They prepare it just right, ((a verb ending in ing)) it
until the meat breaks up and browns, but is still ((an adjective)) and juicy.
Then they add special ((a plural noun)) and place two pieces of delicious ((a
color)) provolone cheese on top of the meat. As soon as it melts, they scoop the
whole thing up and plop it on a ((an adverb)) toasted bun.  The juice ((a verb
ending in s)) into the bread and runs down your ((a body part)) when you bite
into it. Perfect! My mouth was watering just thinking about it. I ((an adverb))
placed my order, dreaming of my Cheesesteak sandwich. As soon as it was ready, I
((a verb, past tense)) back to my office and settled down to savor every mouth
watering bite.  But, wouldn't you know, they'd given me a ((a noun)) on rye
instead!
COOL

t1 = Template.create(title: "Gift Giving", story: gift)
t1.slugged = t1.to_param
t1.save!

t2 = Template.create(title: "Lunch Hungers", story: lunch)
t2.slugged = t2.to_param
t2.save!
