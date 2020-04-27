package hrds.agent.job.biz.core.dfstage.fileparser.impl;

import fd.ng.core.utils.StringUtil;
import hrds.agent.job.biz.bean.CollectTableBean;
import hrds.agent.job.biz.bean.TableBean;
import hrds.agent.job.biz.core.dfstage.fileparser.FileParserAbstract;
import hrds.commons.codes.DataBaseCode;
import hrds.commons.exception.AppSystemException;
import hrds.commons.utils.Constant;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.List;

/**
 * CsvFileParserDeal
 * date: 2020/4/21 16:47
 * author: zxz
 */
public class NonFixedFileParserDeal extends FileParserAbstract {

	public NonFixedFileParserDeal(TableBean tableBean, CollectTableBean collectTableBean, String readFile)
			throws Exception {
		super(tableBean, collectTableBean, readFile);
	}

	@Override
	public String parserFile() {
		long fileRowCount = 0;
		String lineValue;
		try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(new File(readFile)),
				DataBaseCode.ofValueByCode(tableBean.getFile_code())))) {
			List<String> valueList;
			while ((lineValue = br.readLine()) != null) {
				fileRowCount++;
				valueList = StringUtil.split(lineValue, tableBean.getColumn_separator());
				//校验数据
				checkData(valueList, fileRowCount);
				dealLine(valueList);
				//每50000行flash一次
				if (fileRowCount % 50000 == 0) {
					writer.flush();
				}
			}
			writer.flush();
		} catch (Exception e) {
			throw new AppSystemException("解析非定长文件转存报错", e);
		}
		return unloadFileAbsolutePath + Constant.METAINFOSPLIT + fileRowCount;
	}
}