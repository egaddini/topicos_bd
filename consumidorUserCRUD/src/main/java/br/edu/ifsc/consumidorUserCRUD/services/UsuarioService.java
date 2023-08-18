package br.edu.ifsc.consumidorUserCRUD.services;

import br.edu.ifsc.consumidorUserCRUD.models.Usuario;
import br.edu.ifsc.consumidorUserCRUD.repositories.UserRepository;
import org.example.dtos.UsuarioDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioService {

    @Autowired
    private UserRepository userRepository;

    public void salvaUsuario(UsuarioDTO usuario) {
        System.out.println("Usuario registrado");
        userRepository.save(new Usuario(usuario.nome, usuario.telefone, usuario.endereco));
    }

    public List<Usuario> buscaUsuarios() {
        return userRepository.findAll();
    }

    public void deletaById(Integer id) {
        System.out.println("Usuario deletado");
        userRepository.deleteById(id);
    }

}
