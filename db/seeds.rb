# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

put 'Starting seeding ....'

10.times do |i|
  User.create!(
    name: "user #{i + 1}",
    email: "user#{i + 1}@ejemplo.com",
    password: 'password123'
  )
end

genres = [
  { name: 'Ciencia Ficción', description: 'Exploración de conceptos futurísticos, ciencia y tecnología.' },
  {
    name: 'Fantasía',
    description: 'Elementos mágicos y sobrenaturales como parte central de la trama, el tema o el escenario.'
  },
  {
    name: 'No Ficción',
    description: 'Escritos basados en hechos, eventos reales y personas reales, como biografías o historias.'
  }
]

genres.each do |genre|
  Genre.create!(name: genre[:name], description: genre[:description])
end

10.times do |i|
  post = Post.new(
    title: "Post Título #{i + 1}",
    body: "Este es el cuerpo del post #{i + 1}.
      Es simplemente un texto de relleno para ilustrar la creación de múltiples posts."
  )
  users = User.all
  genres = Genre.all

  post.user = users.sample
  post.genre = genres.sample

  post.save!
end

put 'Successfully seeded'
