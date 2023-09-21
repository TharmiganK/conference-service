package tk.tharmi.conference.entity;

import io.micronaut.core.annotation.ReflectiveAccess;

@ReflectiveAccess
public class Country {

    private String name;

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }
}
