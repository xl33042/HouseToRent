package com.villege.utils;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import com.villege.entity.sys.*;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.BorderStyle;

public class ExportToExcel {
	public static String getFilename(){
		Date d = new Date();
		int year = d.getYear()+1900;
		int month = d.getMonth()+1;
		int day = d.getDate();
		int hour = d.getHours();
		int minute = d.getMinutes();
		int second = d.getSeconds();
		String sdate = year+"";
		if(month<10)
			sdate += "0"+month;
		else
			sdate += month;
		if(day<10){
			sdate += "0"+day;
		}else{
			sdate += day;
		}
		if(hour<10){
			sdate += "0"+hour;
		}else{
			sdate += hour;
		}
		if(minute<10){
			sdate += "0"+minute;
		}else{
			sdate += minute;
		}
		if(second<10){
			sdate += "0"+second;
		}else{
			sdate += second;
		}
		return sdate;
	}
	public String copyFile(long testId,String path,int code){
		String srcfile = "",descfile="";
		switch(code){
			case 1://导出居民信息
				descfile= getFilename()+".xls";
				srcfile = path +"personInfo.xls";
				break;
			case 3://导出合作伙伴
				descfile= getFilename()+".xls";
				srcfile = path +"/agent.xls";
				break;
		}
		try {
			FileInputStream fis = new FileInputStream(srcfile);
			FileOutputStream fos = new FileOutputStream(path+descfile);
			byte [] buffer = new byte[1024*4];
			while(fis.read(buffer) != -1){
				fos.write(buffer);
			}
			fis.close();
			fos.close();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return descfile;
		
	}

	//导出单位
	public String ExpAgent(List<AgentInfoEntity> info, String path, int code){
		POIFSFileSystem fs = null;
		String filename="";
		int headRow = 2;

		try {
			filename=copyFile(0,path,code);

			fs = new POIFSFileSystem(new FileInputStream(path+filename));
			FileOutputStream fos = new FileOutputStream(path+filename);
			HSSFWorkbook wb1 = new HSSFWorkbook(fs);
			HSSFSheet sheet = wb1.getSheetAt(0);
			int size = info.size();
			int col=0;
			HSSFCellStyle style = wb1.createCellStyle();
			style.setBorderLeft(BorderStyle.THIN);
			style.setBorderRight(BorderStyle.THIN);
			style.setBorderTop(BorderStyle.THIN);
			style.setBorderBottom(BorderStyle.THIN);
			for(int i=0;i<size;i++){
				col=0;
				AgentInfoEntity agent = info.get(i);
				HSSFRow row = sheet.createRow(i+headRow);
				HSSFCell cell = null;
				cell = row.createCell(col++);
				cell.setCellStyle(style);
				cell.setCellValue(agent.getAgentId());
				cell = row.createCell(col++);
				cell.setCellStyle(style);
				cell.setCellValue(agent.getAgentNo());
				cell = row.createCell(col++);
				cell.setCellStyle(style);
				cell.setCellValue(agent.getAgentName());
				cell = row.createCell(col++);
				cell.setCellStyle(style);
				cell.setCellValue(agent.getContact());

				cell = row.createCell(col++);
				cell.setCellStyle(style);
				cell.setCellValue(agent.getMobile());
				Date d = agent.getRegisterTime();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String sdate = "";
				if(d !=null) {
					sdate = sdf.format(d);
				}
				cell = row.createCell(col++);
				cell.setCellStyle(style);
				cell.setCellValue(sdate);

				cell = row.createCell(col++);
				cell.setCellStyle(style);
				String state="正常";
				if(agent.getState()==0){
					state="禁用";
				}
				cell.setCellValue(state);
				cell = row.createCell(col++);
				cell.setCellStyle(style);
				cell.setCellValue(agent.getManagerName());
			}
			wb1.write(fos);
			fos.close();
			wb1=null;
			fs=null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filename;
	}


	public static String toDate(Date date){
		String str = "";
		if(date==null)
			str="";
		else
		{
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			str= df.format(date);
		}
		return str;
	}
}
