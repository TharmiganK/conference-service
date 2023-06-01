package nl.craftsmen.conference;

import jakarta.validation.constraints.Size;
import org.eclipse.microprofile.config.inject.ConfigProperties;
import org.eclipse.microprofile.config.inject.ConfigProperty;

@ConfigProperties(prefix = "app")
public class ConferenceConfiguration {

    @ConfigProperty(name = "hellomessage")
    @Size(min= 5)
    public String hellomessage;
}
