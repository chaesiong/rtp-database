CREATE JAVA SOURCE NAMED "PIBICSDM2"."JAVAREADFILE" AS 
 import java.lang.*;import java.io.*;public class JAVAREADFILE{public static void readfile(String filename) throws IOException{FileReader f = new FileReader(filename);BufferedReader fr = new BufferedReader(f);String text = fr.readLine();while(text != null){System.out.println(text);text = fr.readLine();}fr.close();}}
/
