import java.util.Scanner;

class MainPage {

	public void mainePage(int cart) {

		// 기본 메인화면을 보여준다
		// 부분-----------------------------------------------------------------------------------
		System.out.print("내비게이션 바 ==> ");
		System.out.println("옷 쇼핑모려(팀1) 1. 메인화면 2.소개 3. 제품 4. 마이페이지 5. 로그인 6. 장바구니(" + cart + ")");

		System.out.println();
		System.out.println();

		System.out.println("==옷 쇼핑몰(팀1)==");
		System.out.println("==남성 전문 쇼핑몰==");

		System.out.println();
		System.out.println();

		System.out.println("==쿠폰 적용 가능 상품==");
		System.out.println("1. 반팔 티셔츠 5종(42,000원)");
		System.out.println("2. 카고팬츠(55,000원 -> 할인가:48,000원)");
		System.out.println("3. 카고 바지(49,000원 -> 할인가:47,000원)");
		System.out.println("4. 데님 팬츠(39,000원)");
		System.out.println("5. 반팔 셔츠(55,000원 -> 할인가:48,000원)");
		System.out.println("6. 데님 팬츠(58,000원)");

		System.out.println();

		System.out.println("==쿨팬츠 특가 상품==");
		System.out.println("1. 밴딩 팬츠 2종(32,000원 -> 할인가:28,000원)");
		System.out.println("2. 쿨 팬츠 2종(32,000원)");

		// 원하는 기능 선택 내비게이션바 or 상품 전보
		System.out.println();
		System.out.println();
		System.out.println("원하는 기능을 선택해 주세요(1. 내비게이션바 2. 옷 상품 보기 3. 종료)");

		System.out.println();
		System.out.println();

	}

}

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc = new Scanner(System.in);
		int cart = 0;
		int selFn;

		MainPage mainPage = new MainPage();
		mainPage.mainePage(cart); // 메인 페이지를 보여준다.

		// 원하는 기능을 선택해 주세요(1. 내비게이션바 2. 옷 상품 보기 3. 종료)를 반복하는 부분----------------------
		while (true) {

			// 내비게이션바 에서 원하는 기능을 선택 하는 부분
			selFn = sc.nextInt();
			int secFn;

			if (selFn == 1) {

				while (true) { // 내비게이션 바에서 무한 반복-------------------------------------------------------------

					System.out.println("원하는 기능을 선택해 주세요");
					System.out.println("1. 메인화면 2.소개 3. 제품 4. 마이페이지 5. 로그인 6. 장바구니(" + cart + ") 7. 종료");
					secFn = sc.nextInt();

					if (secFn == 1) {
						System.out.println("================메인화면 입니다.================");
						mainPage.mainePage(cart);
					} else if (secFn == 2) {
						System.out.println("소개 입니다.");
					} else if (secFn == 3) {
						int option;
						System.out.println("옵션을 선택해 주세요(1. 전체 상품 2. 인기 상품 3. 신상)");
						option = sc.nextInt();
						if (option == 1) {
							System.out.println("전체 상품 입니다.");
						} else if (option == 2) {
							System.out.println("인기 상품 입니다.");
						} else if (option == 3) {
							System.out.println("신상 상품 입니다.");
						}
					} else if (secFn == 4) {
						System.out.println("========마이페이지 화면 입니다.========");
					} else if (secFn == 5) {
						System.out.println("로그인 화면 입니다.");
					} else if (secFn == 6) {
						System.out.println("장바구니 화면 입니다.");
						System.out.println("장바구니 : " + cart);
					} else if (secFn == 7) {
						System.out.println("종료");
						System.out.println("원하는 기능을 선택해 주세요(1. 내비게이션바 2. 옷 상품 보기 3. 종료)");
						break;
					} else {
						System.out.println("없는 기능 입니다.");
					}

				}

				// 옷 전체 상품에 대한 정보를 보여준다
			} else if (selFn == 2) {

				// 2. 옷 상품 보기를 무한 반복하는
				// 부분-------------------------------------------------------------------------
				while (true) {

					System.out.print("1. 쿠폰 적용 가능 상품 2. 쿨팬츠 특가 상품 3. 종료");
					int product = sc.nextInt();

					// 쿠폰 적용 가능 상품을 보여준다
					if (product == 1) {
						System.out.println("==쿠폰 적용 가능 상품==");
						System.out.println("1. 반팔 티셔츠 5종(42,000원)");
						System.out.println("2. 카고팬츠(55,000원 -> 할인가:48,000원)");
						System.out.println("3. 카고 바지(49,000원 -> 할인가:47,000원)");
						System.out.println("4. 데님 팬츠(39,000원)");
						System.out.println("5. 반팔 셔츠(55,000원 -> 할인가:48,000원)");
						System.out.println("6. 데님 팬츠(58,000원)");

						int sel;
						System.out.print("원하는 상품을 선택해 주세요 : ");
						sel = sc.nextInt();

						if (sel == 1) {
							System.out.println("해당 상품 1. 상세보기 2. 장바구니 담기");
							int sel2 = sc.nextInt();

							if (sel2 == 1) {
								System.out.println("1. 반팔 티셔츠 5종(42,000원)");
							} else if (sel2 == 2) {
								System.out.println("장바구니에 추가 되었습니다.");
								cart++;
							}

						} else if (sel == 2) {
							System.out.println("해당 상품 1. 상세보기 2. 장바구니 담기");
							int sel2 = sc.nextInt();

							if (sel2 == 1) {
								System.out.println("2. 카고팬츠(55,000원 -> 할인가:48,000원)");
							} else if (sel2 == 2) {
								System.out.println("장바구니에 추가 되었습니다.");
								cart++;
							}
						} else if (sel == 3) {
							System.out.println("3. 카고 바지(49,000원 -> 할인가:47,000원)");
							int sel2 = sc.nextInt();

							if (sel2 == 1) {
								System.out.println("1. 반팔 티셔츠 5종(42,000원)");
							} else if (sel2 == 2) {
								System.out.println("장바구니에 추가 되었습니다.");
								cart++;
							}
						} else if (sel == 4) {
							System.out.println("4. 데님 팬츠(39,000원)");
							int sel2 = sc.nextInt();

							if (sel2 == 1) {
								System.out.println("1. 반팔 티셔츠 5종(42,000원)");
							} else if (sel2 == 2) {
								System.out.println("장바구니에 추가 되었습니다.");
								cart++;
							}
						} else if (sel == 5) {
							System.out.println("5. 반팔 셔츠(55,000원 -> 할인가:48,000원)");
							int sel2 = sc.nextInt();

							if (sel2 == 1) {
								System.out.println("1. 반팔 티셔츠 5종(42,000원)");
							} else if (sel2 == 2) {
								System.out.println("장바구니에 추가 되었습니다.");
								cart++;
							}
						} else if (sel == 6) {
							System.out.println("해당 상품 1. 상세보기 2. 장바구니 담기");
							int sel2 = sc.nextInt();

							if (sel2 == 1) {
								System.out.println("6. 데님 팬츠(58,000원)");
							} else if (sel2 == 2) {
								System.out.println("장바구니에 추가 되었습니다.");
								cart++;
							}
						} else if (sel == 7) {
							System.out.println("종료");
							System.out.println("원하는 기능을 선택해 주세요(1. 내비게이션바 2. 옷 상품 보기 3. 종료)");
							break;
						} else {
							System.out.println("없는 기능 입니다.");
						}

						// 특가 상품에 대한 정보를 보여준다
					} else if (product == 2) {
						System.out.println("==쿨팬츠 특가 상품==");
						System.out.println("1. 밴딩 팬츠 2종(32,000원 -> 할인가:28,000원)");
						System.out.println("2. 쿨 팬츠 2종(32,000원)");

						int sel;
						System.out.print("원하는 상품을 선택해 주세요 : ");
						sel = sc.nextInt();

						if (sel == 1) {
							System.out.println("해당 상품 1. 상세보기 2. 장바구니 담기");
							int sel2 = sc.nextInt();

							if (sel2 == 1) {
								System.out.println("1. 밴딩 팬츠 2종(32,000원 -> 할인가:28,000원)");
							} else if (sel2 == 2) {
								System.out.println("장바구니에 추가 되었습니다.");
								cart++;
							}
						} else if (sel == 2) {
							System.out.println("해당 상품 1. 상세보기 2. 장바구니 담기");
							int sel2 = sc.nextInt();

							if (sel2 == 1) {
								System.out.println("2. 쿨 팬츠 2종(32,000원)");
							} else if (sel2 == 2) {
								System.out.println("장바구니에 추가 되었습니다.");
								cart++;
							}

						} else {
							System.out.println("없는 기능 입니다.");
						}

					}else if(product ==3) {
						System.out.println("종료");
						System.out.println("원하는 기능을 선택해 주세요(1. 내비게이션바 2. 옷 상품 보기 3. 종료)");
						break;
					}
				}

				System.out.println();
			} else if (selFn == 3) {
				System.out.println("프로그램 종료");
				break;
			}

		}
	}

}
