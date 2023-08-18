package br.edu.ifsc.consumidorUserCRUD.controllers;

import br.edu.ifsc.consumidorUserCRUD.models.Usuario;
import br.edu.ifsc.consumidorUserCRUD.services.UsuarioService;
import org.example.constants.RabbitMQConstants;
import org.example.dtos.UsuarioDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "api/usuario")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping
    private List<Usuario> buscaUsuarios() {
        return usuarioService.buscaUsuarios();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<HttpStatus> deleteUser(@PathVariable("id") Integer id) {
        usuarioService.deletaById(id);
        return ResponseEntity.ok(HttpStatus.OK);
    }

}