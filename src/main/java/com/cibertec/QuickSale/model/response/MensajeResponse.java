package com.cibertec.QuickSale.model.response;

import java.io.Serializable;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MensajeResponse implements Serializable {

	private String mensaje;
	private Object object;
	private boolean success;

	@Override
	public String toString() {
		return "MensajeResponse [mensaje=" + mensaje + ", object=" + object + "]";
	}
}
