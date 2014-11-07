package vn.onepay.excel.service.impl;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.hssf.record.crypto.Biff8EncryptionKey;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import vn.onepay.excel.service.ExportService;
import vn.onepay.excel.service.model.ExcelResult;

public class ExportServiceImpl implements ExportService {
	public ExcelResult export(Object dataBean, String dataKey,
			byte[] tempFile, boolean isProtect)
			throws ParsePropertyException, InvalidFormatException, IOException,
			GeneralSecurityException {
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		ExcelResult result = new ExcelResult();
		result.setIsProtect(isProtect);
		// fill data to template
		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put(dataKey, dataBean);
		XLSTransformer transformer = new XLSTransformer();
		HSSFWorkbook workbook = (HSSFWorkbook) transformer.transformXLS(
				new ByteArrayInputStream(tempFile), beans);
		if (!isProtect) {
			result.setPassWord(null);
			try {
				workbook.write(bos);
			} finally {
				bos.close();
			}
			byte[] bytes = bos.toByteArray();
			result.setData(bytes);
		} else {
			Integer password = this.getRandomInteger(100000, 999999);
			Biff8EncryptionKey.setCurrentUserPassword(password.toString());
			workbook.writeProtectWorkbook(
					Biff8EncryptionKey.getCurrentUserPassword(), "");
			result.setPassWord(password.toString());
			// convert to byte
			try {
				workbook.write(bos);
			} finally {
				bos.close();
			}
			byte[] bytes = bos.toByteArray();
			result.setData(bytes);
		}
		
		return result;
	}

	private Integer getRandomInteger(int aStart, int aEnd) {
		Random random = new Random();
		if (aStart > aEnd) {
			throw new IllegalArgumentException("Start cannot exceed End.");
		}
		// get the range, casting to long to avoid overflow problems
		long range = (long) aEnd - (long) aStart + 1;
		// compute a fraction of the range, 0 <= frac < range
		long fraction = (long) (range * random.nextDouble());
		return (int) (fraction + aStart);
	}
}
