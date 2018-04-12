package drawBoard;

public class PathTDataBean {
	//PATHT
	private String pathid;
	private String ipaddress;
	private String localpath;
	private int pathport;
	private String ftpuser;
	private String ftppasswd;
	private String alias;
	private String active;
	private String backuppath;
	  
	public String getPathid() {
		return pathid;
	}
	public void setPathid(String pathid) {
		this.pathid = pathid;
	}
	public String getIpaddress() {
		return ipaddress;
	}
	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}
	public String getLocalpath() {
		return localpath;
	}
	public void setLocalpath(String localpath) {
		this.localpath = localpath;
	}
	public int getPathport() {
		return pathport;
	}
	public void setPathport(int pathport) {
		this.pathport = pathport;
	}
	public String getFtpuser() {
		return ftpuser;
	}
	public void setFtpuser(String ftpuser) {
		this.ftpuser = ftpuser;
	}
	public String getFtppasswd() {
		return ftppasswd;
	}
	public void setFtppasswd(String ftppasswd) {
		this.ftppasswd = ftppasswd;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getBackuppath() {
		return backuppath;
	}
	public void setBackuppath(String backuppath) {
		this.backuppath = backuppath;
	}
}
