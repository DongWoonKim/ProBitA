package handler.drawBoard;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import drawBoard.BoardDao;
import handler.CommandHandler;

@Controller
public class inputChartBaseToImageDecoder implements CommandHandler {

	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@RequestMapping("/inputChartImage")	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html; charset=UTF-8"); 
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMddHHmmss", Locale.KOREA );
		Date currentTime = new Date ();
		String mTime = mSimpleDateFormat.format ( currentTime );
	 
		
		String get = request.getParameter("image");
		get = get.replaceAll("\\p{Z}", "+");	 
		get = get.replaceAll("_", "/");
		get = get.replaceAll("-", "+"); 
		String target = "C:\\BitChart\\"+mTime+".png";		
		String data = get.split(",")[1];
		
		byte[] imageBytes = DatatypeConverter.parseBase64Binary(data);
		
		File file = null;		
		try {			
			BufferedImage bufImg = ImageIO.read(new ByteArrayInputStream(imageBytes));			
			file = new File(target);
			if(!file.exists()) {
				file.mkdirs();				 			
			}		 			
			ImageIO.write(bufImg, "png", file);			
		} catch (IOException e) {
			e.printStackTrace();			 
		}		
		return new ModelAndView("chartImageToDecoderAjax");
	}
}
