person = Person.create(
  first_name: "Juan José",
  last_name: "Ramírez Calderón"
)

Collaborator.create(
  person_id: person.id,
  email: "jjramirez@pucp.pe",
  password: "qwerty",
  role: "admin"
)