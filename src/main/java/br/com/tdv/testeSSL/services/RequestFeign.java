package br.com.tdv.testeSSL.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import br.com.tdv.testeSSL.models.response.AndamentoPesquisa;

@Service
public class RequestFeign {
	
	@Autowired
	private IFeingRequest feignRequest;
	
	public ResponseEntity<AndamentoPesquisa> pegaRequest(String codigoPesquisa, String cnpj){
		try {
			ResponseEntity<AndamentoPesquisa> andamento = feignRequest.getAndamento(codigoPesquisa, cnpj);
			return andamento;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

}
