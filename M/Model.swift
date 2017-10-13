//
//  Character.swift
//  UPCarouselFlowLayoutDemo
//
//  Created by Paul Ulric on 28/06/2016.
//  Copyright © 2016 Paul Ulric. All rights reserved.
//

import Foundation

struct FilmIndustry {
    let industryImageName: String!
    let industryName: String!
    let industryDescription: String!
}

struct Genere {
    let genereImageName: String!
    let genereName: String!
    let level: String!
    let subGenere: [Genere]!
}

struct Film {
    let filmImageName: String!
    let filmName: String!
    let filmDescription: String!
}

var filmIndustryArr: [FilmIndustry] = [
    FilmIndustry(industryImageName: "Hollywood.jpg", industryName: "Hollywood", industryDescription: "Hollywood has been the home of movie stars and movie studios. When you think of the center of the American entertainment industry, you think of Hollywood."),
    FilmIndustry(industryImageName: "Bollywood.jpg", industryName: "Bollywood", industryDescription: "Bollywood is the nickname given to the Indian film industry - it's a play on the word Hollywood. The B comes from Bombay (also known as Mumbai), a big city in India. Films are made so fast that sometimes actors on set shoot scenes for four different films at a time - using the same actors and the same backgrounds."),
    FilmIndustry(industryImageName: "Kollywood.jpg", industryName: "Kollywood", industryDescription: "Kollywood for Tamil, Kodambakkam is a part of Chennai city and it is here the film studios producing Tamil films are concentrated"),
    FilmIndustry(industryImageName: "Lollywood.jpg", industryName: "Lollywood", industryDescription: "Lollywood is the name for the Pakistani popular film industry, based in Lahore."),
    FilmIndustry(industryImageName: "Mollywood.jpg", industryName: "Mollywood", industryDescription: "Mollywood may refer to: Malayalam cinema, a sector of the Indian film industry."),
    FilmIndustry(industryImageName: "Tollywood.jpg", industryName: "Tollywood", industryDescription: "The cinema of Andhra Pradesh, also referred to as Telugu Cinema or Tollywood, is the Telugu film industry in India. The Telugu language film industry of Andhra Pradesh is one India's largest film industries in terms of films produced yearly."),
    FilmIndustry(industryImageName: "Sandelwood.jpg", industryName: "Sandelwood", industryDescription: "Sandalwood is a part of Indian cinema, where motion pictures are produced in the Kannada language. "),
    FilmIndustry(industryImageName: "China.jpg", industryName: "Cinema of China", industryDescription: "The cinema of China is one of three distinct historical threads of Chinese-language cinema together with the cinema of Hong Kong and the cinema of Taiwan."),
    FilmIndustry(industryImageName: "Japan.jpg", industryName: "Cinema of Japan", industryDescription: "The cinema of Japan has a history that spans more than 100 years. Japan has one of the oldest and largest film industries in the world; as of 2010, it was the fourth largest by number of feature films produced."),
    FilmIndustry(industryImageName: "Korea.jpg", industryName: "Cinema of Korea", industryDescription: "Cinema of Korea encompasses the motion picture industries of North and South Korea. As with all aspects of Korean life during the past century, the film industry has often been at the mercy of political events, from the late Joseon dynasty to the Korean War to domestic governmental interference.")
]

var filmArr: [Film] = [
    Film(filmImageName: "Veeram.jpg", filmName: "Veeram", filmDescription: "Vinayagam lives with his four brothers and they often get into trouble with the law. In order to clear their own path, the siblings try to hook up Vinayagam with a girl. But his past poses a problem."),
    Film(filmImageName: "Avatar.jpg", filmName: "Avatar", filmDescription: "Jake, a paraplegic marine, replaces his brother on the Na'vi inhabited Pandora for a corporate mission. He is accepted by the natives as one of their own but he must decide where his loyalties lie."),
    Film(filmImageName: "Bahubali.jpg", filmName: "Bahubali, The Beginning", filmDescription: "In the kingdom of Mahishmati, while pursuing his love, Shivudu learns about the conflict-ridden past of his family and his legacy. He must now prepare himself to face his new-found archenemy. Shiva, the son of Bahubali, begins to search for answers after he learns about his heritage."),
    Film(filmImageName: "Enthiran.jpg", filmName: "Enthiran 2.0", filmDescription: "2.0 is an upcoming Indian science fiction film written and directed by S. Shankar, co-written by B. Jeyamohan and produced by Subaskaran Allirajah, founder of Lyca Productions."),
    Film(filmImageName: "Gladiator.jpg", filmName: "Gladiator", filmDescription: "Commodus takes over power and demotes Maximus, one of the preferred generals of his father, Emperor Marcus Aurelius. As a result, Maximus is relegated to fighting till death as a gladiator."),
    Film(filmImageName: "Hulk.jpg", filmName: "Hulk", filmDescription: "Bruce Banner, a bionuclear researcher encounters a fatal accident in his laboratory. Life changes thereon, when his anger transforms him into an endangering green monster."),
    Film(filmImageName: "Interstellar.jpg", filmName: "Interstellar", filmDescription: "In the future, Earth is slowly becoming uninhabitable. Ex-NASA pilot Cooper, along with a team of researchers, is sent on a planet exploration mission to report which planet can sustain life."),
    Film(filmImageName: "Ironclad.jpg", filmName: "Ironclad", filmDescription: "A few barons band together and force the tyrannical King John to enforce the Magna Carta. However, the king goes back on his word and assembles an army to wipe out the barons."),
    Film(filmImageName: "Kaththi.jpg", filmName: "Kaththi", filmDescription: "Kathiresan, who escapes from prison, accidentally meets his lookalike Jeeva, who gets shot by some goons. Kathiresan masquerades as Jeeva in order to save himself, but it turns him into a crusader."),
    Film(filmImageName: "Lordoftherings.jpg", filmName: "Lord Of The Rings", filmDescription: "A young hobbit, Frodo, who has found the One Ring that belongs to the Dark Lord Sauron, begins his journey with eight companions to Mount Doom, the only place where it can be destroyed."),
    Film(filmImageName: "Spartacus.jpg", filmName: "Spartacus, War Of The Damned", filmDescription: "The rebellious Thracian Spartacus, born and raised a slave, is sold to Gladiator trainer Batiatus. After weeks of being trained to kill for the arena, Spartacus turns on his owners and leads the other slaves in rebellion. As the rebels move from town to town, their numbers swell as escaped slaves join their ranks. Under the leadership of Spartacus, they make their way to southern Italy, where they will cross the sea and return to their homes."),
    Film(filmImageName: "Spartan.jpg", filmName: "Spartan", filmDescription: "Leonidas, a young Spartan warrior, takes a handful of bare-chested, breakdancing men along with him on a mission to bring down the evil overweight Persian ruler Xerxes."),
    Film(filmImageName: "Terminator.jpg", filmName: "Terminator Genesis", filmDescription: "John sends Kyle to the year 1984 to protect his mother Sarah from being killed. When the timeline is altered, Kyle asks her to travel to the year 2017 to stop an AI system that wants to wipe mankind."),
    Film(filmImageName: "Thuppaki.jpg", filmName: "Thuppaki", filmDescription: "An army captain visits Mumbai to be with his family and find a suitable bride. However, an explosion in the city sets him off on a mission to find and disable a terrorist sleeper cell in the city."),
    Film(filmImageName: "Titanic.jpg", filmName: "Titanic", filmDescription: "Seventeen-year-old Rose hails from an aristocratic family and is set to be married. When she boards the Titanic, she meets Jack Dawson, an artist, and falls in love with him.")
]

var genereArr: [Genere?] = [
    Genere(genereImageName: "Action.jpg", genereName: "Action", level: "1", subGenere: [Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: []), Genere(genereImageName: "Crime.jpg", genereName: "Crime", level: "2", subGenere: []), Genere(genereImageName: "Thriller.jpg", genereName: "Thriller", level: "2", subGenere: []), Genere(genereImageName: "Adventure.jpg", genereName: "Adventure", level: "2", subGenere: [])]),
    Genere(genereImageName: "Adventure.jpg", genereName: "Adventure", level: "1", subGenere: [Genere(genereImageName: "Biography.jpg", genereName: "Biography", level: "2", subGenere: []), Genere(genereImageName: "Thriller.jpg", genereName: "Thriller", level: "2", subGenere: []), Genere(genereImageName: "War.jpg", genereName: "War", level: "2", subGenere: [])]),
    Genere(genereImageName: "Animation.jpg", genereName: "Animation", level: "1", subGenere: [Genere(genereImageName: "Adventure.jpg", genereName: "Adventure", level: "2", subGenere: []), Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: []), Genere(genereImageName: "Family.jpg", genereName: "Family", level: "2", subGenere: []), Genere(genereImageName: "Adventure.jpg", genereName: "Fantasy", level: "2", subGenere: [])]),
    Genere(genereImageName: "Biography.jpg", genereName: "Biography", level: "1", subGenere: [Genere(genereImageName: "Crime.jpg", genereName: "Crime", level: "2", subGenere: []), Genere(genereImageName: "Mystery.jpg", genereName: "Mystery", level: "2", subGenere: []), Genere(genereImageName: "Sport.jpg", genereName: "Sport", level: "2", subGenere: [])]),
    Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "1", subGenere: [Genere(genereImageName: "Action.jpg", genereName: "Action", level: "2", subGenere: []), Genere(genereImageName: "Horror.jpg", genereName: "Horror", level: "2", subGenere: []), Genere(genereImageName: "Romance.jpg", genereName: "Romance", level: "2", subGenere: [])]),
    Genere(genereImageName: "Crime.jpg", genereName: "Crime", level: "1", subGenere: [Genere(genereImageName: "Drama.jpg", genereName: "Drama", level: "2", subGenere: []), Genere(genereImageName: "Adventure.jpg", genereName: "Mystery", level: "2", subGenere: []), Genere(genereImageName: "Romance.jpg", genereName: "Romance", level: "2", subGenere: [])]),
    Genere(genereImageName: "Documentary.jpg", genereName: "Documentary", level: "1", subGenere: [Genere(genereImageName: "Biography.jpg", genereName: "Biography", level: "2", subGenere: []), Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: []), Genere(genereImageName: "Crime.jpg", genereName: "Crime", level: "2", subGenere: []), Genere(genereImageName: "History.jpg", genereName: "History", level: "2", subGenere: [])]),
    Genere(genereImageName: "Drama.jpg", genereName: "Drama", level: "1", subGenere: [Genere(genereImageName: "Romance.jpg", genereName: "Romance", level: "2", subGenere: []), Genere(genereImageName: "Music.jpg", genereName: "Music", level: "2", subGenere: []), Genere(genereImageName: "War.jpg", genereName: "War", level: "2", subGenere: [])]),
    Genere(genereImageName: "Family.jpg", genereName: "Family", level: "1", subGenere: [Genere(genereImageName: "Adventure.jpg", genereName: "Adventure", level: "2", subGenere: []), Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: []), Genere(genereImageName: "Adventure.jpg", genereName: "Fantasy", level: "2", subGenere: []), Genere(genereImageName: "Romance.jpg", genereName: "Romance", level: "2", subGenere: [])]),
    Genere(genereImageName: "History.jpg", genereName: "History", level: "1", subGenere: [Genere(genereImageName: "Adventure.jpg", genereName: "Adventure", level: "2", subGenere: []), Genere(genereImageName: "Biography.jpg", genereName: "Biography", level: "2", subGenere: []), Genere(genereImageName: "Drama.jpg", genereName: "Drama", level: "2", subGenere: []), Genere(genereImageName: "War.jpg", genereName: "War", level: "2", subGenere: [])]),
    Genere(genereImageName: "Horror.jpg", genereName: "Horror", level: "1", subGenere: [Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: []), Genere(genereImageName: "Drama.jpg", genereName: "Drama", level: "2", subGenere: []), Genere(genereImageName: "Sci-Fi.jpg", genereName: "Sci-Fi", level: "2", subGenere: [])]),
    Genere(genereImageName: "Music.jpg", genereName: "Music", level: "1", subGenere: [Genere(genereImageName: "Biography.jpg", genereName: "Biography", level: "2", subGenere: []), Genere(genereImageName: "Documentary.jpg", genereName: "Documentary", level: "2", subGenere: []), Genere(genereImageName: "Drama.jpg", genereName: "Drama", level: "2", subGenere: [])]),
    Genere(genereImageName: "Mystery.jpg", genereName: "Mystery", level: "1", subGenere: [Genere(genereImageName: "Adventure.jpg", genereName: "Adventure", level: "2", subGenere: []), Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: []), Genere(genereImageName: "Thriller.jpg", genereName: "Thriller", level: "2", subGenere: [])]),
    Genere(genereImageName: "Romance.jpg", genereName: "Romance", level: "1", subGenere: [Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: []), Genere(genereImageName: "Crime.jpg", genereName: "Crime", level: "2", subGenere: []), Genere(genereImageName: "History.jpg", genereName: "History", level: "2", subGenere: []), Genere(genereImageName: "Thriller.jpg", genereName: "Thriller", level: "2", subGenere: [])]),
    Genere(genereImageName: "Sci-Fi.jpg", genereName: "Sci-Fi", level: "1", subGenere: [Genere(genereImageName: "Animation.jpg", genereName: "Animation", level: "2", subGenere: []), Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: []), Genere(genereImageName: "Family.jpg", genereName: "Family", level: "2", subGenere: []), Genere(genereImageName: "Horror.jpg", genereName: "Horror", level: "2", subGenere: [])]),
    Genere(genereImageName: "Sport.jpg", genereName: "Sport", level: "1", subGenere: [Genere(genereImageName: "Biography.jpg", genereName: "Biography", level: "2", subGenere: []), Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: []), Genere(genereImageName: "Documentary.jpg", genereName: "Documentary", level: "2", subGenere: [])]),
    Genere(genereImageName: "Thriller.jpg", genereName: "Thriller", level: "1", subGenere: [Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: []), Genere(genereImageName: "Crime.jpg", genereName: "Crime", level: "2", subGenere: []), Genere(genereImageName: "Horror.jpg", genereName: "Horror", level: "2", subGenere: []), Genere(genereImageName: "Mystery.jpg", genereName: "Mystery", level: "2", subGenere: [])]),
    Genere(genereImageName: "War.jpg", genereName: "War", level: "1", subGenere: [Genere(genereImageName: "Action.jpg", genereName: "Action", level: "2", subGenere: []), Genere(genereImageName: "Biography.jpg", genereName: "Biography", level: "2", subGenere: []), Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: []), Genere(genereImageName: "Documentary.jpg", genereName: "Documentary", level: "2", subGenere: [])]),
    Genere(genereImageName: "Western.jpg", genereName: "Western", level: "1", subGenere: [Genere(genereImageName: "Action.jpg", genereName: "Action", level: "2", subGenere: []), Genere(genereImageName: "Adventure.jpg", genereName: "Adventure", level: "2", subGenere: []), Genere(genereImageName: "Comedy.jpg", genereName: "Comedy", level: "2", subGenere: [])])
]


