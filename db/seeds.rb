# clear data first
Viewer.delete_all
User.delete_all
Movie.delete_all
Genre.delete_all

User.create!(email: 'admin@example.com', password: '86WmYwjFVF>q}@7P')
genres = Genre.create([
                        {name: 'Action'},
                        { name: 'Adventure' },
                        { name: 'Animation' },
                        { name: 'Biography' },
                        { name: 'Comedy' },
                        { name: 'Crime' },
                        { name: 'Documentary' },
                        { name: 'Drama' },
                        { name: 'Fantasy' },
                        { name: 'History' },
                        { name: 'Horror' },
                        { name: 'Musical' },
                        { name: 'Mystery' },
                        { name: 'Romance' },
                        { name: 'Sci-Fi' },
                        { name: 'Thriller' },
                        { name: 'War' },
                        { name: 'Western' },
                      ])
movies = Movie.create!([
                         { name: 'STAR WARS: THE RISE OF SKYWALKER',
                           year: 1977,
                           director: "J.J. Abrams",
                           main_star: "Mark Hammil, Adam Driver",
                           description: "When it's discovered that the evil Emperor Palpatine did not die at the hands of Darth Vader, the rebels must race against the clock to find out his whereabouts. Finn and Poe lead the Resistance to put a stop to the First Order's plans to form a new Empire",
                           genres: Genre.order("random()").limit(3)
                         },
                         { name: 'THE LORD OF THE RINGS - THE RETURN OF THE KING',
                           year: 2003,
                           director: "Peter Jackson",
                           main_star: "Elijah Wood, Ian Mc Kellen",
                           genres: Genre.order("random()").limit(3),
                           description: "The culmination of nearly 10 years' work and conclusion
to Peter Jackson's epic trilogy based on the timeless J.R.R. Tolkien classic"
                         }])

# movies.each do |movie|
#   movie.genres = Genre.order("random()").limit(3)
# end

viewers = Viewer.create!([
                          { username: "user1_example" },
                          { username: "user2_example" },
                          { username: "user3_example" }
                        ])
