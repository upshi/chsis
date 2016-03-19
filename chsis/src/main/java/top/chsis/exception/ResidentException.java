package top.chsis.exception;

public class ResidentException extends Exception {

	private static final long serialVersionUID = 1L;

	public ResidentException() {
		super();
	}

	public ResidentException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public ResidentException(String message, Throwable cause) {
		super(message, cause);
	}

	public ResidentException(String message) {
		super(message);
	}

	public ResidentException(Throwable cause) {
		super(cause);
	}

	
	
}
