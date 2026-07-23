# db/seeds.rb

# Clear existing data so seeds are idempotent
Audition.destroy_all
Role.destroy_all

# --- Roles ---
hamlet   = Role.create!(character_name: "Hamlet")
ophelia  = Role.create!(character_name: "Ophelia")
guard    = Role.create!(character_name: "Guard") # no auditions at all, for edge-case testing

# --- Auditions for Hamlet ---
# Two hired (to test `understudy` / multiple hires) + one not hired
Audition.create!(actor: "Daniel Fields", location: "New York", phone: 5551234567, hired: true, role: hamlet)
Audition.create!(actor: "Marcus Webb", location: "Chicago", phone: 5559876543, hired: true, role: hamlet)
Audition.create!(actor: "Priya Anand", location: "Boston", phone: 5552223333, hired: false, role: hamlet)

# --- Auditions for Ophelia ---
# None hired yet — good for testing the "no actor has been hired" fallback
Audition.create!(actor: "Sofia Reyes", location: "Los Angeles", phone: 5554445555, hired: false, role: ophelia)
Audition.create!(actor: "Grace Kim", location: "Seattle", phone: 5556667777, hired: false, role: ophelia)

# Guard has zero auditions on purpose — lets you test `actors`/`locations` returning []
# and `lead`/`understudy` behavior when find_by returns nil

puts "Seeded #{Role.count} roles and #{Audition.count} auditions."