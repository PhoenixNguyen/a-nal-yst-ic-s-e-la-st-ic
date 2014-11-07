import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;

public class ExcelExporterTest {
	public static void main(String[] args) throws Exception {
		List<Student> students = new ArrayList<ExcelExporterTest.Student>();
		ExcelExporterTest x = new ExcelExporterTest();
		Random r = new Random();
		for(int i = 0; i < 10; i++) {
			Student student = x.new Student();
			student.setName("Student "  + (i+1));
			student.setAge(r.nextInt(30));
			
			students.add(student);
		}
		
		x.export(students, "student", "/home/thuannh/Desktop/student.xls", "/home/thuannh/Desktop/student_list.xls");
	}
	
	private void export(List<?> dataList, String dataKey, String tempFilePath, String desFilePath) throws ParsePropertyException, InvalidFormatException, IOException {
		Map<String, Object> beans = new HashMap<String, Object>();
        beans.put(dataKey, dataList);
		XLSTransformer transformer = new XLSTransformer();
        File tempFile = new File(tempFilePath);
        if(!tempFile.exists()) {
        	System.out.println("Template file not found!");
        	return;
        }
        
		Workbook workbook = transformer.transformXLS(new FileInputStream(tempFile), beans);
        //
        String fileName = desFilePath.substring(desFilePath.lastIndexOf("/") + 1);
//        Nếu download file excel
//        response.setContentType("application/vnd.ms-excel");
//        response.setHeader("Content-Disposition", "attachment; filename="+fileName);
//        OutputStream outputStream = response.getOutputStream();
        OutputStream outputStream = new FileOutputStream(desFilePath);
        
        workbook.setSheetName(0, fileName.substring(0, fileName.lastIndexOf(".")));
        workbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
        
        System.out.println("Export is OK!");
	}
	
	public class Student implements Serializable {
		private String name;
		private int age;
		
		public String getName() {
			return name;
		} 
		public void setName(String name) {
			this.name = name;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
	}
}
