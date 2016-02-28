FactoryGirl.define do
  factory :book do
    title 'The Hitchhiker’s Guide to the Galaxy'
    author 'Douglas Adams'
    description "The book begins with contractors arriving at Arthur Dent's house. They wish to demolish his house in order to build a bypass. Arthur's best friend, Ford Prefect, arrives, warning him of the end of the world. The two head to a bar, where the locals question Ford's knowledge of the Apocalypse. An alien race, known as Vogons, show up to demolish the planet, and Arthur and Ford manage to get on their ship just before Earth is demolished, where they are forced to listen to Vogon poetry as punishment. Arthur tries to say it is beautiful to avoid being thrown out of an airlock with Ford."
    image Rails.root.join('spec', 'fixtures', 'book.jpg')
  end
end
