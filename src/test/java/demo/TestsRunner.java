package demo;

import com.intuit.karate.junit5.Karate;

public class TestsRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:demo/");
    }

}
