package demo.utils;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

public abstract class Utils {

    public static String nameGenerator(){
        List<String> names = Arrays.asList("Neo", "Trinity", "Morpheus");

        int index = new Random().nextInt(3);

        return names.get(index);
    }
}
