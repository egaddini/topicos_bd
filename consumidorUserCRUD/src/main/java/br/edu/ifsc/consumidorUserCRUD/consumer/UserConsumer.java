package br.edu.ifsc.consumidorUserCRUD.consumer;

import br.edu.ifsc.consumidorUserCRUD.services.UsuarioService;
import org.example.constants.RabbitMQConstants;
import org.example.dtos.UsuarioDTO;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserConsumer {

    @Autowired
    private UsuarioService usuarioService;

    @RabbitListener(queues = RabbitMQConstants.FILA_CADASTRO)
    private void consumidor(UsuarioDTO usuario) {

        usuarioService.salvaUsuario(usuario);
    }
}
