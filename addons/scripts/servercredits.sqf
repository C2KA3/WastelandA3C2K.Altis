sleep 60;

private ["_messages", "_timeout"];

_messages = [
	["Seja Bem Vindo", (name player)],
	["Crazy To Kill Wasteland Servers", worldName],
	["Nível dos Bots", "HARDCORE"],
	["Headshot No Revive", "ATIVADO"],
	["Database", "extDB2"],
	["ATM limit max", "100.000.000"],
	["Mapa", "Altis"],	
	["Site", "www.CLANC2K.com.br"],	
	["Teamspeak", "TS3.CLANC2K.COM.BR"],
	["Doação", "CLANC2K.com.br/doacao"],
	["Servidor Conect", "ARMA3.CLANC2K.COM.BR"],
    ["Porta", "2302"]	
	
];

_timeout = 10;
{
	private ["_title", "_content", "_titleText"];
	uiSleep 2;
	_title = _x select 0;
	_content = _x select 1;
	_titleText = format[("<t font='TahomaB' size='0.40' color='#a81e13' align='left' shadow='1' shadowColor='#000000'>%1</t><br /><t shadow='1'shadowColor='#000000' font='TahomaB' size='0.60' color='#FFFFFF' align='left'>%2</t>"), _title, _content];
	[_titleText,[safezoneX + safezoneW - 0.8,0.50],[safezoneY + safezoneH - 0.8,0.7],_timeout,0.5] spawn BIS_fnc_dynamicText;
	uiSleep (_timeout * 1.1);
} forEach _messages;
