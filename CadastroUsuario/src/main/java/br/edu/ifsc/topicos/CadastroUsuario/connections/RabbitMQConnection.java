package br.edu.ifsc.topicos.CadastroUsuario.connections;

import jakarta.annotation.PostConstruct;
import org.example.constants.RabbitMQConstants;
import org.springframework.amqp.core.AmqpAdmin;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.stereotype.Component;


@Component
public class RabbitMQConnection {

    private AmqpAdmin amqpAdmin;
    private static final String NOME_EXCHANGE = "amq.direct";

    public RabbitMQConnection(AmqpAdmin amqpAdmin) {
        this.amqpAdmin = amqpAdmin;
    }

    private Queue fila(String nomeFila) {
        return  new Queue(nomeFila, true, false, false);
    }

    private DirectExchange trocaDireta() {
        return new DirectExchange(NOME_EXCHANGE);
    }

    private Binding relacionamento(Queue fila, DirectExchange troca) {
        return new Binding(fila.getName(), Binding.DestinationType.QUEUE, troca.getName(), fila.getName(), null);
    }

    @PostConstruct
    private void adiciona() {
       Queue filaCadastro =  this.fila(RabbitMQConstants.FILA_CADASTRO);

       DirectExchange troca = trocaDireta();

       Binding ligacaoCadastro = this.relacionamento(filaCadastro, troca);

       this.amqpAdmin.declareQueue(filaCadastro);

       this.amqpAdmin.declareExchange(troca);

       this.amqpAdmin.declareBinding(ligacaoCadastro);

    }

}
