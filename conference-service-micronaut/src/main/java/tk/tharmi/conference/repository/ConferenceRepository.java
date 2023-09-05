package tk.tharmi.conference.repository;

import io.micronaut.data.annotation.Repository;
import io.micronaut.data.jpa.repository.JpaRepository;
import tk.tharmi.conference.entity.Conference;

@Repository
public interface ConferenceRepository extends JpaRepository<Conference, Long> {
    
}
