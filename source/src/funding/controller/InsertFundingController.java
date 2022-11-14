package funding.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileService;
import common.IFileService;
import funding.service.FundingServiceImpl;
import funding.service.IFundingService;
import funding.vo.FundingVO;

@MultipartConfig
@WebServlet("/funding/Insert.do")
public class InsertFundingController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// req.getRequestDispatcher("/WEB-INF/views/funding/fundingInsert.jsp").forward(req, resp);
		// System.out.println("=============ListFundingController==============");
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
			
		String fundingId = req.getParameter("fundingId");
		String memId = req.getParameter("memId");
		String fundingTitle = req.getParameter("fundingTitle");
		
		int targetAmount = 0;
		int recentAmount = 0;
		if( req.getParameter("targetAmount") != null && req.getParameter("targetAmount") != ""  ) {
			targetAmount = Integer.parseInt(req.getParameter("targetAmount"));
		}
		if( req.getParameter("recentAmount") != null && req.getParameter("recentAmount") != "" ) {
			recentAmount = Integer.parseInt(req.getParameter("recentAmount"));
		}
		
		String fundingStartDate = req.getParameter("fundingStartDate");
		String fundingEndDate = req.getParameter("fundingEndDate");
		String fundingAccount = req.getParameter("fundingAccount");
		String fundingAccountHolder = req.getParameter("fundingAccountHolder");
		String fundingBankName = req.getParameter("fundingBankName");
		String fundingDetail = req.getParameter("fundingDetail");
//		String fundingThumbnail = req.getParameter("fundingThumbnail");
		
		IFundingService fundingService = FundingServiceImpl.getInstance();
		
		FundingVO fv = new FundingVO();
		
        // 파일 WebContent/images/thumbnail/에 저장
        IFileService fileService = new FileService();
        fileService.saveImage(req, fv.getFundingThumbnail());
	       
		fv.setFundingId(fundingId);
		fv.setMemId(memId);
		fv.setFundingTitle(fundingTitle);
		fv.setTargetAmount(targetAmount);
		fv.setRecentAmount(recentAmount);
		fv.setFundingStartDate(fundingStartDate);
		fv.setFundingEndDate(fundingEndDate);
		fv.setFundingAccount(fundingAccount);
		fv.setFundingAccountHolder(fundingAccountHolder);
		fv.setFundingBankName(fundingBankName);
		fv.setFundingDetail(fundingDetail);
		fv.setFundingThumbnail(fileService.getSavePath());
		
		System.out.println( fv.toString() );
				
		int cnt = fundingService.registFunding(fv);
		
		String msg = "";
		
		if(cnt>0) {
			msg="성공";
		}else {
			msg = "실패";
		}
		
		System.out.println("== " + req.getContextPath()  +" ==");		
		req.getSession().setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath()+"/funding/List.do");
	}

}
