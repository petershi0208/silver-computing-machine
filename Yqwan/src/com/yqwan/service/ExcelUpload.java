package com.yqwan.service;

import java.io.FileInputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelUpload {


    public void print2() throws Exception {
            HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(
                            "d:\\aa.xls"));
            HSSFSheet sheet = wb.getSheetAt(0);
            
            HSSFRow row = null;
            HSSFCell cell = null;
            int rowNum=sheet.getLastRowNum();							//获得总行数
            int coloumNum=sheet.getRow(0).getPhysicalNumberOfCells();	//获得总列数
            
            System.out.println(coloumNum+""+rowNum);
            System.out.println(cell);
            for (int i = 0; i <= rowNum; i++) {
				row=sheet.getRow(i);
				for (int j = 0; j < coloumNum; j++) {
					cell=row.getCell(j);
					System.out.println(cell);
				}
			}
    }

}