package vn.onepay.excel.service;

import java.io.IOException;
import java.security.GeneralSecurityException;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import net.sf.jxls.exception.ParsePropertyException;



import vn.onepay.excel.service.model.ExcelResult;

public interface ExportService {
	public ExcelResult export(Object dataBean, String dataKey,
			byte[] tempFile, boolean isProtect)
			throws ParsePropertyException, InvalidFormatException, IOException,
			GeneralSecurityException;
}
