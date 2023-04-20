package kr.co.house.model.service;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.house.model.dao.HouseDao;
import kr.co.house.model.vo.FindRoomByCondition;
import kr.co.house.model.vo.House;
import kr.co.house.model.vo.Room;
import kr.co.house.model.vo.RoomBook;

@Service
public class HouseService {

	@Autowired
	private HouseDao dao;


// 숙박 상품 상세페이지 보기.  House 테이블에서 Row 1개 전체 조회 후 반환
	public House selectOneHouse(int houseNo) {
		return dao.selectOneHouse(houseNo);
	}



	@Transactional
// 숙박 상품 등록.  House 테이블에 Row 1개 추가
	public int insertHouse(House h) {
		return dao.insertHouse(h);
	}



	@Transactional
// 숙박 상품 수정.  House 테이블에서 Row 1개 수정
	public int updateHouse(House h) {
		return dao.updateHouse(h);
	}



// 상품 등록 후 숙박 상품 사진들 업로드
	public int uploadHousePhotos(House h) {
		return dao.uploadHousePhotos(h);
	}



	@Transactional
// 객실 등록.  Room 테이블에 Row 여러개 추가
	public int insertRooms(Room r) {
		int result = 0;
		for(int i=0; i<r.getRoomNames().length; i++) {
			r.setRoomName(r.getRoomNames()[i]);
			result += dao.insertRoom(r);
		}
		return result;
	}


// 기존 객실의 이름을 변경하기 전에 중복 검사. roomTitle과 roomName을 WHERE 조건으로 Room 테이블에서 조회 후 count를 반환
	public int checkRoomNewName(String roomTitle, String roomName) {
		Room r = new Room();
		r.setRoomTitle(roomTitle);
		r.setRoomName(roomName);
		return dao.checkRoomNewName(r);
	}



	@Transactional
// 기존 객실의 이름을 변경하는 함수. Room 테이블에서 update
	public int updateRoomName(Room r) {
		return dao.updateRoomName(r);
	}



	@Transactional
// 모든 객실들의 활성 상태값을 일괄적으로 변경.  Room 테이블에 Row 여러개 변경
	public int updateRoomEnable(String roomNo, String roomEnable) {
		StringTokenizer roomNoString = new StringTokenizer(roomNo,"/");
		StringTokenizer roomEnableString = new StringTokenizer(roomEnable,"/");
		int result = 0;
		Room r = new Room();
		while(roomNoString.hasMoreTokens()) {
			int roomNoToken = Integer.parseInt(roomNoString.nextToken());
			int roomEnableToken = Integer.parseInt(roomEnableString.nextToken());
			r.setRoomNo(roomNoToken);
			r.setRoomEnable(roomEnableToken);
			result += dao.updateRoomEnable(r);
		}
		return result;
	}



// 하나의 숙박 상품에 대한 객실들 조회.  숙박 상품이 갖고 있는 roomTitle과 roomCapa를 WHERE 조건으로 가져와서 Room 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<Room> selectAllAvailableRoom(FindRoomByCondition condition) {
		return dao.selectAllAvailableRoom(condition);
	}
	
//모달용으로 복사, 예약이 없는(예약테이블에는 있어도 결제완료는 되어있지 않은 방들)을 조회	
	public ArrayList<House> selectAllAvailableRoomList(House h) {
		return dao.selectAllAvailableRoomList(h);
	}



// 하나의 houseNo에 대한 모든 객실들을 조회. 사용 중지된 객실도 포함하여 Room 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<Room> selectAllRoomsByHouseNo(int houseNo) {
		return dao.selectAllRoomsByHouseNo(houseNo);
	}



// 객실 이름들 중복 여부 조회. roomTitle을 WHERE 조건으로 Room 테이블에서 Row 0개 이상 조회 후 반환
	public ArrayList<String> checkRoomNameInSameRoomTitle(FindRoomByCondition condition) {
		return dao.checkRoomNameInSameRoomTitle(condition);
	}



// 하나의 객실에 대한 예약 내역(결제 완료 상태) 조회.    ROOM_BOOK 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<RoomBook> selectAllBook(int roomNo){
		return dao.selectAllBook(roomNo);
	}
	
// 네이버지도 api 마커를 위한 경도,위도 조회.
	public ArrayList<House> selectAllAddress(){
		return dao.selectAllAddress();
	}



	public ArrayList<House> selectRoomList(House house) {
		return dao.selectRoomList(house);
	}


	
}
