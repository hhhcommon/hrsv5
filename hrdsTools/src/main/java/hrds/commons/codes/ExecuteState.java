package hrds.commons.codes;
/**Created by automatic  */
/**代码类型名：运行状态  */
public enum ExecuteState {
	/**开始运行<KaiShiYunXing>  */
	KaiShiYunXing("01","开始运行","10","运行状态"),
	/**运行完成<YunXingWanCheng>  */
	YunXingWanCheng("02","运行完成","10","运行状态"),
	/**运行失败<YunXingShiBai>  */
	YunXingShiBai("99","运行失败","10","运行状态"),
	/**通知成功<TongZhiChengGong>  */
	TongZhiChengGong("20","通知成功","10","运行状态"),
	/**通知失败<TongZhiShiBai>  */
	TongZhiShiBai("21","通知失败","10","运行状态"),
	/**暂停运行<ZanTingYunXing>  */
	ZanTingYunXing("30","暂停运行","10","运行状态");

	private final String code;
	private final String value;
	private final String catCode;
	private final String catValue;

	ExecuteState(String code,String value,String catCode,String catValue){
		this.code = code;
		this.value = value;
		this.catCode = catCode;
		this.catValue = catValue;
	}
	public String getCode(){return code;}
	public String getValue(){return value;}
	public String getCatCode(){return catCode;}
	public String getCatValue(){return catValue;}

	/**根据指定的代码值转换成中文名字
	* @param code   本代码的代码值
	* @return
	*/
	public static String getValue(String code) {
		for (ExecuteState typeCode : ExecuteState.values()) {
			if (typeCode.getCode().equals(code)) {
				return typeCode.value;
			}
		}
		throw new RuntimeException("根据"+code+"没有找到对应的代码项");
	}

	/**根据指定的代码值转换成对象
	* @param code   本代码的代码值
	* @return
	*/
	public static ExecuteState getCodeObj(String code) {
		for (ExecuteState typeCode : ExecuteState.values()) {
			if (typeCode.getCode().equals(code)) {
				return typeCode;
			}
		}
		throw new RuntimeException("根据"+code+"没有找到对应的代码项");
	}

	/**
	* 获取代码项的中文类名名称
	* @return
	*/
	public static String getObjCatValue(){
		return ExecuteState.values()[0].getCatValue();
	}

	/**
	* 获取代码项的分类代码
	* @return
	*/
	public static String getObjCatCode(){
		return ExecuteState.values()[0].getCatCode();
	}
}
