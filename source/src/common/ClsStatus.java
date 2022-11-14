package common;

public enum ClsStatus {
	POST('N'),
	DELETE('Y');
	
	ClsStatus(char status){
		this.status = status;
	}
	char status = 'N';
}
