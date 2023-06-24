package tharmigan.springboot.conference_service;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface ConferenceRepository extends JpaRepository<Conference, Long> {

}
