package br.com.tdv.testeSSL.exceptions;

import org.springframework.boot.context.properties.source.InvalidConfigurationPropertyValueException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * Controller que monitora outros controllers da aplicação, captura as exceções
 * lançadas por eles e trata-as.
 */

@ControllerAdvice
public class ExceptionHandlerController {

	@ExceptionHandler(Exception.class)
	public ResponseEntity<?> Exception(Exception exception) {
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@ExceptionHandler(InvalidConfigurationPropertyValueException.class)
	public ResponseEntity<?> resourceNotFoundException(InvalidConfigurationPropertyValueException exception) {
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
}
