	if (mtDropDown.isSupported()) {

		var ms = new mtDropDownSet(mtDropDown.direction.down, 0, 0, mtDropDown.reference.bottomLeft);

		var menu1 = ms.addMenu(document.getElementById("menu1"));
		menu1.addItem("- ��˾���","About.asp?id=1"); // send no URL if nothing should happen onclick
		menu1.addItem("- ��˾�Ļ�","About.asp?id=2"); // send no URL if nothing should happen onclick
		menu1.addItem("- �ɳ�����","About.asp?id=3");
		menu1.addItem("- ��֯����","About.asp?id=4");
		menu1.addItem("- ��ϵ����","About.asp?id=5");	
	
//�ڶ��˵�
		var menu2 = ms.addMenu(document.getElementById("menu2"));
		menu2.addItem("- ��ҵ����", "news.asp"); 
		menu2.addItem("- ҵ����Ѷ", "yenews.asp"); // send no URL if nothing should happen onclick
	
		// menu : 3
		var menu3 = ms.addMenu(document.getElementById("menu3"));
		menu3.addItem("- ��Ʒչʾ", "Product.asp");
		menu3.addItem("- ��Ʒ����", "Products.asp");	   
		
		// menu : 4
		var menu4 = ms.addMenu(document.getElementById("menu4"));
		menu4.addItem("- ��ҵ����", "Honor.asp");
		menu4.addItem("- ��ҵ����", "Img.asp");
		
		// menu : 5
		var menu5 = ms.addMenu(document.getElementById("menu5"));
		menu5.addItem("- �����г�", "Sale.asp?id=6");
		menu5.addItem("- �����г�", "Sale.asp?id=7");

		// menu : 6
		var menu6 = ms.addMenu(document.getElementById("menu6"));
		menu6.addItem("- �˲���Ƹ", "Job.asp");
		menu6.addItem("- �˲Ų���", "Jobs.asp");		
			
		// menu : 7
		var menu7 = ms.addMenu(document.getElementById("menu7"));
		menu7.addItem("- ��Ա����", "Server.asp");
		menu7.addItem("- ��Ϣ����", "Feedback.asp");
		menu7.addItem("- ��������", "NetBook.asp");
		menu7.addItem("- ������ѯ", "E_shop.asp");		
	
		mtDropDown.renderAll();
	}
