package tk.tharmi.conference.entity;

import io.micronaut.core.annotation.ReflectiveAccess;

@ReflectiveAccess
public class ExtendedConference {
    private String name;

    private String countryName;

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(final String countryName) {
        this.countryName = countryName;
    }
}
