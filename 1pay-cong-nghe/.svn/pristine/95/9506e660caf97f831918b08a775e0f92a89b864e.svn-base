package vn.onepay.dev.api;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import vn.onepay.account.model.Account;
import vn.onepay.cache.dynacache.DynaCache;
import vn.onepay.common.SharedConstants;
import vn.onepay.dev.controller.DevAbstractController;
import vn.onepay.service.ServiceFinder;

public class SdkApiAjax extends DevAbstractController {

	@Override
	protected ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {

		Account account = (Account) request.getSession().getAttribute(
				SharedConstants.ACCOUNT_LOGINED);

		String action = StringUtils.trimToEmpty(request.getParameter("a"));

		try {
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");

			if ("sdk_demo".equalsIgnoreCase(action)) {
				return new ModelAndView("redirect:"
						+ sdkDemo(account, request, response));
			} else if("sdk_zip".equalsIgnoreCase(action)) {
				return new ModelAndView("redirect:"
						+ sdkZip(account, request, response)); 
			}
			 

		} catch (Exception e) {
			response.getOutputStream().write(e.getMessage().getBytes());
		}

		return null;
	}

	private static final String JAR_SIGNER = "jarsigner -storepass 123456 -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ${keystore} ${apkFile} 1PaySdkDemo";
	private static final String SDK_CHARGING_CONFIG_URL = "https://1pay.vn/console/sdk-charging-config.wss?access_key=${accesskey}&sdk=full";
	private static final List<String> IGNORE_ENTRIES = Arrays.asList(new String[] {
																			"META-INF", 
																			"META-INF/MANIFEST.MF",
																			"META-INF/1PAYSDKD.SF",
																			"META-INF/1PAYSDKD.RSA",
																			"META-INF/CERT.SF",
																			"META-INF/CERT.RSA"
																			});

	private String sdkDemo(Account account, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String sdkDataFolderName 	= "sdk-data";
		String sdkDemoFileKeyStore 	= "1pay-sdk-demo-key.keystore";
		String sdkDemoFileName 		= "1PayDemo.apk";
		String sdkDemoUrl 			= "/" + sdkDataFolderName + "/" + sdkDemoFileName;
		String accessKey 			= StringUtils.trimToEmpty(request.getParameter("accesskey"));
		
		if (account != null && account.isMerchant()
				&& StringUtils.isNotBlank(accessKey)) {
			String sdkFolder = request.getSession().getServletContext()
					.getRealPath("/" + sdkDataFolderName + "/");
			String yourSdkDemoFolder = account.getUsername() + "/" + accessKey;
			String yourSdkDemoFile = yourSdkDemoFolder + "/" + sdkDemoFileName;
			File destFile = new File(sdkFolder + "/" + yourSdkDemoFile);
			if (!destFile.getParentFile().exists())
				destFile.getParentFile().mkdirs();

//			FileUtils.copyFile(new File(sdkFolder + "/" + sdkDemoFileName),
//					destFile);
			
			DynaCache httpDynaCache = ServiceFinder.getContext(request).getBean("httpDynaCache", DynaCache.class);
			String url = SDK_CHARGING_CONFIG_URL
								.replace("${accesskey}", accessKey);
			String ccfStr = StringUtils.trimToEmpty((String) httpDynaCache.getCachedItem(url));
			
			File ccf = new File(sdkFolder + "/" + yourSdkDemoFolder + "/charging_config.txt");
			FileUtils.writeStringToFile(ccf, ccfStr, "UTF-8");
			
			File[] files = {ccf};
			String[] paths = {"res/raw"};
			addFilesToZip(new File(sdkFolder + "/" + sdkDemoFileName), destFile, files, paths, IGNORE_ENTRIES);
			
			ccf.delete();
			
			if (destFile.exists()) {
				String command = JAR_SIGNER.replace("${keystore}",
						sdkFolder + "/" + sdkDemoFileKeyStore).replace(
						"${apkFile}", sdkFolder + "/" + yourSdkDemoFile);
				System.out.println(command);
				
				Process p = Runtime.getRuntime().exec(command);
				p.waitFor();

				BufferedReader reader = new BufferedReader(
						new InputStreamReader(p.getInputStream()));

				String line = "";
				while ((line = reader.readLine()) != null) {
					System.out.println(line);
				}

				sdkDemoUrl = "/" + sdkDataFolderName + "/" + yourSdkDemoFile;
			}
		}

		System.out.println(sdkDemoUrl);
		return sdkDemoUrl;
	}
	
	private String sdkZip(Account account, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String sdkDataFolderName 	= "sdk-data";
		String sdkDemoFileName 		= "1PaySDK-Android.zip";
		String sdkDemoUrl 			= "/" + sdkDataFolderName + "/" + sdkDemoFileName;
		String accessKey 			= StringUtils.trimToEmpty(request.getParameter("accesskey"));
		
		if (account != null && account.isMerchant()
				&& StringUtils.isNotBlank(accessKey)) {
			String sdkFolder = request.getSession().getServletContext()
					.getRealPath("/" + sdkDataFolderName + "/");
			String yourSdkDemoFolder = account.getUsername() + "/" + accessKey;
			String yourSdkDemoFile = yourSdkDemoFolder + "/" + sdkDemoFileName;
			File destFile = new File(sdkFolder + "/" + yourSdkDemoFile);
			if (!destFile.getParentFile().exists())
				destFile.getParentFile().mkdirs();

			DynaCache httpDynaCache = ServiceFinder.getContext(request).getBean("httpDynaCache", DynaCache.class);
			String url = SDK_CHARGING_CONFIG_URL
								.replace("${accesskey}", accessKey);
			String ccfStr = StringUtils.trimToEmpty((String) httpDynaCache.getCachedItem(url));
			
			File ccf = new File(sdkFolder + "/" + yourSdkDemoFolder + "/charging_config.txt");
			FileUtils.writeStringToFile(ccf, ccfStr, "UTF-8");
			
			File[] files = {ccf};
			String[] paths = {"1PaySDK-Android/res/raw"};
			addFilesToZip(new File(sdkFolder + "/" + sdkDemoFileName), destFile, files, paths, IGNORE_ENTRIES);
			
			ccf.delete();
			
			sdkDemoUrl = "/" + sdkDataFolderName + "/" + yourSdkDemoFile;
		}

		System.out.println(sdkDemoUrl);
		return sdkDemoUrl;
	}

	public static void main(String[] args) {

		try {
			String destZipFile = "/home/thuannh/Desktop/test2.apk";
			String srcFile = "/home/thuannh/Desktop/test.apk";
			String file = "/home/thuannh/Desktop/testzip.txt";
			
			File srcZipFile = new File(srcFile);
			File zipFile = new File(destZipFile);
			File[] files = {new File(file)};
			String[] paths = {"res/raw"};
			addFilesToZip(srcZipFile, zipFile, files, paths, IGNORE_ENTRIES 
					);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	static private void addFilesToZip(File srcZipFile, File zipFile, 
						File[] files, String[] paths,
						List<String> ignoreEntries)
			throws Exception {
		
		// get a temp file
		File tempFile = File.createTempFile(zipFile.getName(), null);
		// delete it, otherwise you cannot rename your existing zip to it.
		tempFile.delete();

		boolean isSameSrc = (srcZipFile != null && zipFile.getAbsolutePath().equals(srcZipFile.getAbsolutePath()));
		
		if(isSameSrc) {
			boolean renameOk = zipFile.renameTo(tempFile);
			if (!renameOk) {
				throw new RuntimeException("could not rename the file "
						+ zipFile.getAbsolutePath() + " to "
						+ tempFile.getAbsolutePath());
			}
		}
		
		byte[] buf = new byte[1024];

		ZipInputStream zin = new ZipInputStream(new FileInputStream(isSameSrc?tempFile:srcZipFile));
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFile));

		ZipEntry entry = zin.getNextEntry();
		while (entry != null) {
			String name = entry.getName();
//			System.out.println(name);
			boolean notInFiles = true;
			for (int i=0; i< files.length; i++) {
				if (((StringUtils.isBlank(paths[i])?"":(paths[i] + "/"))
						+ files[i].getName()).equals(name)
						|| (ignoreEntries != null && ignoreEntries.contains(name))) {
					notInFiles = false;
					break;
				}
			}
			if (notInFiles) {
				// Add ZIP entry to output stream.
				out.putNextEntry(new ZipEntry(name));
				// Transfer bytes from the ZIP file to the output file
				int len;
				while ((len = zin.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			}
			entry = zin.getNextEntry();
		}
		// Close the streams   
		zin.close();
		// Compress the files
		for (int i = 0; i < files.length; i++) {
			InputStream in = new FileInputStream(files[i]);
			// Add ZIP entry to output stream.
			out.putNextEntry(new ZipEntry(
								(StringUtils.isBlank(paths[i])?"":(paths[i] + "/")) 
									+ files[i].getName()));
			// Transfer bytes from the file to the ZIP file
			int len;
			while ((len = in.read(buf)) > 0) {
				out.write(buf, 0, len);
			}
			// Complete the entry
			out.closeEntry();
			in.close();
		}
		// Complete the ZIP file
		out.close();
		tempFile.delete();
	}
}
