package nl.craftsmen.conference;

import io.micronaut.core.annotation.TypeHint;
import io.micronaut.runtime.Micronaut;
import org.hibernate.dialect.H2Dialect;

@TypeHint(typeNames = { "org.h2.Driver", "org.h2.mvstore.db.MVTableEngine"}, value={
        H2Dialect.class,
        org.h2.Driver.class})
public class Application {

    public static void main(String[] args) {
        Micronaut.run(Application.class);
    }
}