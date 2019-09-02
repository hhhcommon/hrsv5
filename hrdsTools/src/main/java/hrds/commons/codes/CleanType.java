package hrds.commons.codes;
/**Created by automatic  */
/**代码类型名：清洗方式  */
public enum CleanType {
	/**字符补齐<ZiFuBuQi>  */
	ZiFuBuQi("1","字符补齐","36","清洗方式"),
	/**字符替换<ZiFuTiHuan>  */
	ZiFuTiHuan("2","字符替换","36","清洗方式"),
	/**时间转换<ShiJianZhuanHuan>  */
	ShiJianZhuanHuan("3","时间转换","36","清洗方式"),
	/**码值转换<MaZhiZhuanHuan>  */
	MaZhiZhuanHuan("4","码值转换","36","清洗方式"),
	/**字符合并<ZiFuHeBing>  */
	ZiFuHeBing("5","字符合并","36","清洗方式"),
	/**字符拆分<ZiFuChaiFen>  */
	ZiFuChaiFen("6","字符拆分","36","清洗方式"),
	/**字符trim<ZiFuTrim>  */
	ZiFuTrim("7","字符trim","36","清洗方式");

	private final String code;
	private final String value;
	private final String catCode;
	private final String catValue;

	CleanType(String code,String value,String catCode,String catValue){
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
		for (CleanType typeCode : CleanType.values()) {
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
	public static CleanType getCodeObj(String code) {
		for (CleanType typeCode : CleanType.values()) {
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
		return CleanType.values()[0].getCatValue();
	}

	/**
	* 获取代码项的分类代码
	* @return
	*/
	public static String getObjCatCode(){
		return CleanType.values()[0].getCatCode();
	}
}
