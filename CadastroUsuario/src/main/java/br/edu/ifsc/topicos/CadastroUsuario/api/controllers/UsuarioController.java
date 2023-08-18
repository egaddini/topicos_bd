package br.edu.ifsc.topicos.CadastroUsuario.api.controllers;

import br.edu.ifsc.topicos.CadastroUsuario.api.services.RabbitMQService;
import org.example.constants.RabbitMQConstants;
import org.example.dtos.UsuarioDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "api/usuario")
public class UsuarioController {

    @Autowired
    private RabbitMQService rabbitMQService;

    @PostMapping
    private ResponseEntity cadastraUsuario(@RequestBody UsuarioDTO usuario) {
        System.out.println(usuario.nome);
        rabbitMQService.enviaMensagem(RabbitMQConstants.FILA_CADASTRO, usuario);
        return new ResponseEntity(HttpStatus.OK);
    }


}
