package br.edu.ifsc.consumidorUserCRUD.repositories;

import br.edu.ifsc.consumidorUserCRUD.models.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<Usuario, Integer> {


}
