package tk.tharmi.conference.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tk.tharmi.conference.entity.Conference;

public interface ConferenceRepository extends JpaRepository<Conference, Long> {

}
