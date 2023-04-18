package kr.co.carpool.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.carpool.model.dao.CarpoolDao;
import kr.co.carpool.model.vo.Carpool;
import kr.co.carpool.model.vo.CarpoolFilter;
import kr.co.carpool.model.vo.CarpoolMatch;
import kr.co.carpool.model.vo.Passenger;

@Service
public class CarpoolService {
	@Autowired
	private CarpoolDao dao;

	public ArrayList<Carpool> selectAllCarpool() {
		return dao.selectAllCarpool();
	}

	public Carpool selectOneCarpool(Carpool carpool) {
		return dao.selectOneCarpool(carpool);
		
	}

	public ArrayList<Carpool> filterCarpool(CarpoolFilter cf, int amount) {
		//System.out.println("controller에서 service로 넘겨준조건"+cf);
		int end = cf.getStart()+amount-1;
		cf.setEnd(end);
		//System.out.println("dao로부터 controller로 넘겨준 것 "+dao.filterCarpool(cf));
		return dao.filterCarpool(cf);
	}

	//카풀 신청하기(승객)
	@Transactional
	public int insertPassenger(CarpoolMatch match) {
		return dao.insertPassenger(match);
	}
	
	//운전자의 카풀 등록하기(controller에서는 registerCarpool)
	@Transactional
	public int insertCarpool(Carpool carpool) {
		return dao.insertCarpool(carpool);
	}
	
	//더보기 버튼 구현을 위한 카풀수 구하기
	public int totalCount(CarpoolFilter cf) {
		return dao.totalCount(cf);
	}
	//운전자의 마이페이지 
	public ArrayList<Carpool> getMyLists(int driverNo) {
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("driverNo",driverNo);
		ArrayList<Carpool> clist = dao.getMyLists(param);
		return clist;
	}
	// 운전자페이지 : matchNo로 카풀 수락, 거절 
	@Transactional
	public int updateDriverDecision(Passenger passenger) {
		return dao.updateDriverDecision(passenger);
	}
	// 운전자페이지 : carpoolNo로 카풀 마감, 취소(아예삭제)
	@Transactional
	public int updateDriverClosing(Carpool carpool) {
		return dao.updateDriverClosing(carpool);
	}
	//탑승자의 마이페이지
	public ArrayList<Carpool> getMyRequests(int memberNo) {
		System.out.println("getMyRequest의 memberNo: "+memberNo);
		//카풀 리스트로 값 반환해주고~
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("memberNo", memberNo);
		ArrayList<Carpool> list = dao.getMyLists(param);
		//반환한 값을 꺼내주는데, carpoolNo와 memberNo 두개를 받아와야하니까
		//HashMap으로 받아온다.
			
		return list;
	}



}
