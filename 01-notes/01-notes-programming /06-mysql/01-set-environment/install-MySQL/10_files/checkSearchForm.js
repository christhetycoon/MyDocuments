function OpenWindowAndSetValue(Url,Width,Height,WindowObj,SetObj)
{
var ReturnStr=showModalDialog(Url,WindowObj,'dialogWidth:'+Width+'pt;dialogHeight:'+Height+'pt;status:no;help:no;scroll:no;');
if (ReturnStr!='007007007007') SetObj.value=ReturnStr;
return ReturnStr;
}

function bookmarkSite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("�����ղ�ʧ�ܣ��������ֶ���ӡ�");
        }
    }
}

function checkss(so,n)
{
	var preSo = keywordjsx;
	if (n == 0 && so.value == preSo )
	{
		so.value="";
		return true;
	}
	if (n == 1)
	{
		if(so.value == preSo )
		{
			so.value="";
		}
		return true;
	}
	if (n == 2 && so.value == "")
	{
		so.value = preSo;
		return true;
	}
	if(n == 4 && (so.value == "" || so.value == preSo ))
	{
		alert("����дҪ�����Ĺؼ���..");
		so.focus();
		return true;
	}
	return true;
}
var keywordjsx="";


