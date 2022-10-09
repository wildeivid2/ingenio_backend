package com.ingenio.ingenio_backend.exceptions;

public class NoFoundDataException extends Exception {

	public NoFoundDataException(String message) {
		super(message);
	}

	public String getMessage(){
		return super.getMessage();
	}

}
