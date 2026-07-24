Role.create(character_name: "Hamlet")
Role.create(character_name: "Ophelia")

Audition.create(actor: "John", location: "NYC", hired: false, role_id: 1)
Audition.create(actor: "Jane", location: "LA", hired: true, role_id: 1)