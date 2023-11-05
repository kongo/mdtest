l = TodoList.create(title: "Standards of reasoning", description: "Inductive argum ents are generalizations, like inferring that all ravens are black based on many individual observations.")

l.list_sections << ListSection.create(title: "Spyridon Marinatos")
l.list_sections << ListSection.create(title: "Achaemenid Persian Empire")

s = ListSection.find 1
s.tasks << Task.new(title: "Around the start", description: "Around the start of the invasion, a Greek force of approximately 7,000 men led by Leonidas marched north to bl ock the pass of Thermopylae.")

s.tasks << Task.new(title: "With the exception", description: "With the exception of the Thebans, most of whom reportedly surrendered, the Greeks fought the Persians to the death.")

s = ListSection.find 2
s.tasks << Task.new(title: "The primary source ", description: "The primary sou rce for the Greco-Persian Wars is the Greek historian Herodotus. The Sicilian historian Diod orus Siculus")

