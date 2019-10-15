package hrds.agent.job.biz.dataclean.columnclean;

import fd.ng.core.annotation.Class;
import fd.ng.core.annotation.Method;
import fd.ng.core.annotation.Param;
import fd.ng.core.annotation.Return;
import fd.ng.core.utils.StringUtil;

import java.util.Map;

@Class(desc = "数据库直连采集列清洗字符替换实现类,继承AbstractColumnClean抽象类，只针对一个字符替换方法进行实现",
		author = "WangZhengcheng")
public class ColReplaceImpl extends AbstractColumnClean {

	@Method(desc = "列清洗字符替换实现", logicStep = "" +
			"1、判断replaceMap是否为空，不为空则表示要进行字符替换" +
			"2、遍历replaceMap，调用方法进行字符替换")
	@Param(name = "replaceMap", desc = "存放有字符替换规则的map集合", range = "不为空，key : 原字符串  value : 新字符串")
	@Param(name = "columnValue", desc = "待清洗字段值", range = "不为空")
	@Return(desc = "清洗后的字段值", range = "不会为null")
	@Override
	public String replace(Map<String, String> replaceMap, String columnValue) {
		//1、判断replaceMap是否为空，不为空则表示要进行字符替换
		if (replaceMap != null && !(replaceMap.isEmpty())) {
			//2、遍历replaceMap，调用方法进行字符替换
			for (String OriField : replaceMap.keySet()) {
				String newField = replaceMap.get(OriField);
				columnValue = StringUtil.replace(columnValue, OriField, newField);
			}
		}
		return columnValue;
	}
}
