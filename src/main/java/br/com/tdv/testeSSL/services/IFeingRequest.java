package br.com.tdv.testeSSL.services;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.tdv.testeSSL.confs.CustomFeignConfiguration;
import br.com.tdv.testeSSL.models.response.AndamentoPesquisa;

@FeignClient(name = "pamcary", url = "https://qualidade.gps-pamcary.com.br/telerisco/webservices/v2/",
configuration = CustomFeignConfiguration.class)
public interface IFeingRequest {
	
	@GetMapping(value = "status-pesquisa/")
	public ResponseEntity<AndamentoPesquisa> getAndamento(@RequestParam(value = "codigoPesquisa")String codigoPesquisa,
			@RequestParam(value = "cnpj") String cnpj);	
}
