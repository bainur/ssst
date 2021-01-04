# clear data first
Movie.delete_all
Genre.delete_all

User.create!(email: 'admin@example.com', password: 'password')
movies = Movie.create([
                        { name: 'STAR WARS: THE RISE OF SKYWALKER',
                          year: 1977,
                          director: "J.J. Abrams",
                          main_star: "Mark Hammil, Adam Driver",
                          description: "When it's discovered that the evil Emperor Palpatine did not die at the hands of Darth Vader, the rebels must race against the clock to find out his whereabouts. Finn and Poe lead the Resistance to put a stop to the First Order's plans to form a new Empire, while Rey anticipates her inevitable confrontation with Kylo"
                        },
                        { name: 'THE LORD OF THE RINGS - THE RETURN OF THE KING',
                          year: 2003,
                          director: "Peter Jackson",
                          main_star: "Elijah Wood, Ian Mc Kellen",
                          description: "The culmination of nearly 10 years' work and conclusion
to Peter Jackson's epic trilogy based on the timeless J.R.R. Tolkien classic,
 'The Lord of the Rings: The Return of the King' presents the final confrontation between the forces of good and evil fighting for control of the future of Middle-earth. Hobbits Frodo and Sam reach Mordor in their quest to destroy the `one ring', while Aragorn leads the forces of good against Sauron's evil army at the stone city of Minas Tirith."
                        }])

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

movies.each do |movie|
  movie.genres = Genre.order("random()").limit(3)
end

viewers = Viewer.create([
                          { username: "user1@example.com" },
                          { username: "user2@example.com" },
                          { username: "user3@example.com" }
                        ])
