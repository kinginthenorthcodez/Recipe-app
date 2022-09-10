# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


if users.count.zero?
  u1 = User.create!(name: 'Tom',email: 'tom@gmail.com',password: 'test123');
  u2 = User.create!(name: 'Jerry',email: 'jerry@gmail.com',password: 'test123');

  inv1 = Inventory.create!(name: 'Inventory 1', user: u1)
  inv2 = Inventory.create!(name: 'Inventory 2', user: u2)

  fd1 = Food.create!(name: 'chilli', measurement_unit: '52', price: 25,user: u1)
  fd2 = Food.create!(name: 'dried fruits', measurement_unit: '25', price: 55,user: u2)
  fd3 = Food.create!(name: 'cakes', measurement_unit: '25', price: 55,user: u2)
  inv_fd1 = InventoryFood.create!(quantity: 5, inventory: inv1, food: fd1)
  inv_fd2 = InventoryFood.create!(quantity: 5, inventory: inv2, food: fd2)
  inv_fd3 = InventoryFood.create!(quantity: 5, inventory: inv1, food: fd3)
end