package ga.beauty.reset.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import ga.beauty.reset.dao.entity.stat.Log_Chart;

@Component
public class ChartFile {
	
	private String defaultFP = "c:/reset/report/";
	
	
	
	public ChartFile() {
	}
	
	private String getFileName(Date date,String command) {
		String filename =  
				defaultFP+command+"/"+ MySDF.SDF_Y.format(date)
				+"/"+MySDF.SDF_M.format(date)
				+"/"+MySDF.SDF_D.format(date)
				+".json";
		return filename;
	}
	
	private List<File> getFileList(String command, int days){
		List<File> files = new ArrayList<File>();
		for(int i=0; i<days; i++) {
			Calendar todayC = new GregorianCalendar();
			todayC.add(Calendar.DATE, -i); // 오늘날짜로부터 -1
			String filename = getFileName(todayC.getTime(), command);
			File file = new File(filename);
			if(file.exists())files.add(file);
		}
		return files;
	}
	
	public Map<String, List<Log_Chart>> getDataForC(String command, int days) throws JsonProcessingException, IOException {
		List<File> files = getFileList(command, days);
		Map<String, List<Log_Chart>> listS = new HashMap<String,List<Log_Chart>>();
		if(command.equals("login")) {
			List<Log_Chart> listSession = new ArrayList<Log_Chart>();
			List<Log_Chart> listLogin = new ArrayList<Log_Chart>();
				for(File file :files) {
					final String daysName = 
							file.getAbsolutePath().replace("\\", "/").replace(defaultFP+command+"/", "")
							.replace(".json","");
					final JsonNode arrNode = new ObjectMapper().readTree(file).get("data");
					if (arrNode.isArray()) {
				    	for (final JsonNode objNode : arrNode) {
				    		if(objNode.get("name").asText().equals("접속자")) {
				    			listSession.add(new Log_Chart("접속자",daysName,objNode.get("num").asInt()));
				    		}else if(objNode.get("name").asText().equals("로그인")){
				    			listLogin.add(new Log_Chart("로그인",daysName,objNode.get("num").asInt()));
				    		}
				    	}// nodesForEach
					}// isArray
				}// filesForEach
			if(listSession.size()>0)listS.put("접속자",listSession);
			if(listLogin.size()>0)listS.put("로그인",listLogin);
		}else {
			
		}
		
		return listS;
	}

	public Map<String,List<Log_Chart>> getDataForEM(String command, int days) {
		// TODO Auto-generated method stub
		return null;
	}

}
