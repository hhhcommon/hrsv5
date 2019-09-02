package hrds.commons.codes;

import hrds.commons.exception.AppSystemException;
/**Created by automatic  */
/**代码类型名：ETL当天调度标志  */
public enum Today_Dispatch_Flag {
	/**是(Y)<YES>  */
	YES("Y","是(Y)","112","ETL当天调度标志"),
	/**否(N)<NO>  */
	NO("N","否(N)","112","ETL当天调度标志");

	private final String code;
	private final String value;
	private final String catCode;
	private final String catValue;

	Today_Dispatch_Flag(String code,String value,String catCode,String catValue){
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
		for (Today_Dispatch_Flag typeCode : Today_Dispatch_Flag.values()) {
			if (typeCode.getCode().equals(code)) {
				return typeCode.value;
			}
		}
		throw new AppSystemException("根据"+code+"没有找到对应的代码项");
	}

	/**根据指定的代码值转换成对象
	* @param code   本代码的代码值
	* @return
	*/
	public static Today_Dispatch_Flag getCodeObj(String code) {
		for (Today_Dispatch_Flag typeCode : Today_Dispatch_Flag.values()) {
			if (typeCode.getCode().equals(code)) {
				return typeCode;
			}
		}
		throw new AppSystemException("根据"+code+"没有找到对应的代码项");
	}

	/**
	* 获取代码项的中文类名名称
	* @return
	*/
	public static String getObjCatValue(){
		return Today_Dispatch_Flag.values()[0].getCatValue();
	}

	/**
	* 获取代码项的分类代码
	* @return
	*/
	public static String getObjCatCode(){
		return Today_Dispatch_Flag.values()[0].getCatCode();
	}
}