package Karate.Cotizacion;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

@KarateOptions(features = "classpath:Karate/Cotizacion/quotation.feature")

public class QuotationRunner {
	
	@BeforeClass
    public static void beforeClass() throws Exception {        
        //TestBase.beforeClass();
    } 
	
	@Test
    public void testParallel() {
      System.setProperty("karate.env", "karateTesting"); // ensure reset if other tests (e.g. mock) had set env in CI
      //Results results = Runner.path("classpath:demo").tags("~@ignore").parallel(5);
      Results results = Runner.parallel(getClass(), 1);
	//Results results = Runner.path("classpath:Karate/Cotizacion").tags("~@ignore").parallel(5);
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);        
    }
    
   /* public static void generateReport(String karateOutputPath) {        
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        //Configuration config = new Configuration(new File("target"), "QuotationRunner");
	    Configuration config = new Configuration(new File("target"), "Quotation");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();        
    }*/
	public static void generateReport(String karateOutputPath) {
		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
		List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
		for (File file : jsonFiles) {
			jsonPaths.add(file.getAbsolutePath());
		}
		Configuration config = new Configuration(new File("target"), "employess");
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
		reportBuilder.generateReports();
	}
}
