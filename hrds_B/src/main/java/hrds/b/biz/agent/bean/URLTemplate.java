package hrds.b.biz.agent.bean;

/**
 * @Description: 数据库连接URL模板
 * @Author: wangz
 * @CreateTime: 2019-10-09-15:40
 * @BelongsProject: hrsv5
 * @BelongsPackage: hrds.b.biz.agent.bean
 **/
//FIXME 名字应该符合功能。比如：DBConnectionProp。
public class URLTemplate {

	//FIXME 注释说明每个变量的含义，用真实的值做例子来说明。
	private String urlPrefix;
	private String ipPlaceholder;
	private String portPlaceholder;
	private String urlSuffix;

	public String getUrlPrefix() {
		return urlPrefix;
	}

	public void setUrlPrefix(String urlPrefix) {
		this.urlPrefix = urlPrefix;
	}

	public String getIpPlaceholder() {
		return ipPlaceholder;
	}

	public void setIpPlaceholder(String ipPlaceholder) {
		this.ipPlaceholder = ipPlaceholder;
	}

	public String getPortPlaceholder() {
		return portPlaceholder;
	}

	public void setPortPlaceholder(String portPlaceholder) {
		this.portPlaceholder = portPlaceholder;
	}

	public String getUrlSuffix() {
		return urlSuffix;
	}

	public void setUrlSuffix(String urlSuffix) {
		this.urlSuffix = urlSuffix;
	}

	@Override
	public String toString() {
		return "URLTemplate{" +
				"urlPrefix='" + urlPrefix + '\'' +
				", ipPlaceholder='" + ipPlaceholder + '\'' +
				", portPlaceholder='" + portPlaceholder + '\'' +
				", urlSuffix='" + urlSuffix + '\'' +
				'}';
	}
}
