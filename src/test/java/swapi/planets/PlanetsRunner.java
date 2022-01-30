package swapi.planets;

import com.intuit.karate.junit5.Karate;

class PlanetsRunner {
    
    @Karate.Test
    Karate testPlanets() {
        return Karate.run("planets").relativeTo(getClass());
    }    

}
