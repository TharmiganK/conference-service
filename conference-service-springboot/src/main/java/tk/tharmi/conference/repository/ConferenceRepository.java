package tk.tharmi.conference.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tk.tharmi.conference.entity.Conference;

@Repository
public interface ConferenceRepository extends JpaRepository<Conference, Long> {

}
