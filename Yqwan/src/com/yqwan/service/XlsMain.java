package com.yqwan.service;

import java.io.FileInputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import org.apache.poi.hssf.usermodel.HSSFCell;  
import org.apache.poi.hssf.usermodel.HSSFRow;  
import org.apache.poi.hssf.usermodel.HSSFSheet;  
import org.apache.poi.hssf.usermodel.HSSFWorkbook;  
import org.apache.poi.ss.usermodel.Cell;
  
public class XlsMain {  
  public static void main( String[] args) throws IOException {  
    XlsMain xlsMain = new XlsMain();  
    xlsMain.readXls();  
  }  
  
  private void readXls() throws IOException{  
    InputStream is = new FileInputStream( "d:\\aa.xls");
    HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);   System.out.println(1);
    // 循环工作表Sheet  
    for(int numSheet = 2; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++){  
      HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);  
      if(hssfSheet == null){  
        continue;  
      }  
      System.out.println(2);
      // 循环行Row   
      for(int rowNum = 0; rowNum <= 5; rowNum++){  
        HSSFRow hssfRow = hssfSheet.getRow(rowNum); 
        if(hssfRow == null){  
          continue;  
        }  
        System.out.println(3);
        // 循环列Cell    
        for(int cellNum = 0; cellNum <= hssfRow.getLastCellNum(); cellNum++){  
          HSSFCell hssfCell = hssfRow.getCell(cellNum);  
          if(hssfCell == null){  
            continue;  
          } 
          if(hssfRow.getCell(9)!=null){//处理函数单元格问题，先将单元格内容转为String
        	  hssfRow.getCell(9).setCellType(Cell.CELL_TYPE_STRING);
         }
          System.out.print("" + getValue(hssfCell));  
        }  
        System.out.println(" >>>");  
      }  
    }  
  }  
    
  
  private String getValue(HSSFCell hssfCell){  
    if(hssfCell.getCellType() == Cell.CELL_TYPE_BOOLEAN){  
      return String.valueOf( hssfCell.getBooleanCellValue());  
    }else if(hssfCell.getCellType() == Cell.CELL_TYPE_NUMERIC){  
      return String.valueOf( hssfCell.getNumericCellValue());  
    }else if (hssfCell.getCellType() ==Cell.CELL_TYPE_STRING){
    	return String.valueOf(hssfCell.getStringCellValue());
    }else{  
      return String.valueOf( hssfCell.getStringCellValue());  
    }  
  }  
}