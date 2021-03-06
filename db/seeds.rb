# Requiring the ruby file we used to set up
# and configure the connection we made to 
# our sqlite3 database

require_relative "db_config.rb"
Category.delete_all
Post.delete_all
User.delete_all

# Using our models to seed our database!
# We're just creating new rows in our DB
# using dummy data.

# We pass in a hash of information where
# the keys are the column names in our table,
# and the values are whatever made up info
# we want to add in.

Artist_Bio = Category.create({category_name: "Artist Bio"})
Galleries = Category.create({category_name: "Galleries"})
Artistic_Movements = Category.create({category_name: "Artistic Movements"})
Art_news = Category.create({category_name: "Art News"})


p1 = Post.create({
	created_at: DateTime.now,
	article: "David Zwirner Gallery is a contemporary art gallery in New York City and London owned by David Zwirner that is active in both the primary and secondary markets. From about 2000 to 2012, it was known as Zwirner & Wirth Gallery. Address: 525 W 19th St, New York, NY 10011",
	image_url: "http://16fdn9ufhox41fwkc1azw8b1bio.wpengine.netdna-cdn.com/wp-content/uploads/2012/09/19th_Street.jpg",
	title_of_article: "David Zwirner Gallery"
	})

p2 = Post.create ({
	created_at: DateTime.now, 
	article:"The post-World War II period from 1945 until 1970 is recognized as one of the most creative artistic periods of the 20th century, spanning movements from Abstract Expressionism in New York in the 1940s to Pop Art that was popular mainly in England and the United States (from late 1950s to early 1970s).",
	title_of_article: "Post War and Contemporary Art",
	image_url:"http://www1.pictures.zimbio.com/gi/Christie+Post+War+Contemporary+Art+Sale+Preview+wV48GuxKuQYl.jpg"

	})

p3 = Post.create ({
	created_at: DateTime.now, 
	article:"BIOGRAPHY. Utilizing fluorescent light tubing available on the commercial market, Dan Flavin created light installations (or “situations” as he preferred to call them) that became icons of Minimalism. Flavin’s wall- and floor-mounted, site-specific fixtures, composed of intersecting and parallel lines of light in conventional colors, flood spaces with their glow. A number of the sculptures feature tubes traversing corners or doorways, or at a right angle to the wall, further engaging the architecture of a room. As Flavin’s installations grew more complex, so too did the spaces built expressly for the purpose of exhibiting them. In 1959, when Flavin was shortly employed as a guard and elevator operator at the Museum of Modern Art, he met fellow Minimalists Sol LeWitt, Robert Mangold, and Robert Ryman.",
	title_of_article: "Dan Flavin",
	image_url:"http://images.complex.com/complex/image/upload/t_article_image/dsl7bhnpu2eqis5dajtj.jpg"
	})

p4 = Post.create ({
	   created_at: DateTime.new, article:"Art Basel in Miami Beach closes its 14th edition today, with dealers packing their wares back into crates this evening. Some of those works are destined for collectors’ homes, some headed back to gallery storage. The former group does not include the volume of seven- and eight-figure pieces that it has in recent years, at least as far as what dealers would report publicly. Completed transactions as of Saturday evening topped out at around $15 million, the asking price for Francis Bacon’s Man in Blue VI (1954) sold from Van de Weghe’s stand.The New York dealer also sold Picasso’s Buste au Chapeau (1971) for $10.5 million. And a handful of sales were reported at or above the million-dollar mark: Andy Warhol’s 1980 silkscreen of Joseph Beuys on offer from Thaddaeus Ropac sold for $1.4 million; a Günther Uecker nail painting, Ohne Titel (Untitled) (1962), sold for $1 million at Skarstedt; Leipzig school (and current figuration boom) forebear Neo Rauch’s Lösung (Solution) (2005) from David Zwirner went for $1.5 million; Paul McCarthy’s White Snow, Dopey, Black Red White, Black (2011-2015) was also acquired for $1.5 million from Hauser & Wirth; a Robert Indiana work sold from Gmurzynska’s standout Germano Celant-curated stand; and at least one Louise Nevelson fetched $1 million from Pace’s sold-out presentation of 16 of her works.",
	   title_of_article: "What Sold at Art Basel in Miami Beach",
	   image_url:"https://i.embed.ly/1/display/resize?width=1100&quality=95&grow=false&url=https%3A%2F%2Fartsy-media-uploads.s3.amazonaws.com%2F640IMv0AgGxjBj8cAi8sZg%252FAlmine%2BRech%2Bat%2BArt%2BBasel%2Bin%2BMiami%2BBeach%2B2015.jpg&key=a1f82558d8134f6cbebceb9e67d04980"
	})

p1.categories.push(Galleries)
p2.categories.push(Artistic_Movements)
p3.categories.push(Artist_Bio)
p4.categories.push(Art_news)


u1 = User.create({
  password: "celine", 
  password_confirmation: "celine",
  username: "natasha"
})


u1.posts.push(p1)
u1.posts.push(p2)
u1.posts.push(p3)
u1.posts.push(p4)

