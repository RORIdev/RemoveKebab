
function Processo
{
	param($name)
	Get-Process $name -ErrorAction SilentlyContinue
}

function Servico
{
	param($name)
	Get-Service $name -ErrorAction SilentlyContinue
}
# Para adicionar um processo na lista faça o seguinte passo a passo

echo "Checking Processes ..."
# 1. Adicione ele aqui desta forma :
# $nome = Processo nome
#  Ex : $firefox = Processo firefox
#  Ex : $sony_vegas = Processo "Sony Vegas Pro 11"
$yourphone = Processo yourphone
$skype = Processo skypeapp 
$skypebh = Processo skypebackgroundhelper 

# 2. Registre o processo na lista abaixo
$ProcRegistry =@{
	yourphone=$yourphone;
	skype=$skype;
	skypebh=$skypebh#;
	#nome=$nome
	# Não esqueça de colocar o ; [Ponto e Virgula] após cada linha (exceto a ultima)
}

# Para adicionar um servico na lista faça o seguinte passo a passo
echo "Checking Services ..."

# 1. Adicione ele aqui desta forma :
# $nome = Servico nome
#  Ex : $hamachi = Processo "Hamachi2Svc"

$bonjour = Servico "Bonjour Service" 
$amds = Servico "Apple Mobile Device Service" 
$hamachi = Servico "Hamachi2Svc" 
$logmein = Servico "LMIGuardianSvc"
$postgres = Servico "postgresql-x64-9.5" 
$sqlwriter = Servico "SQLWriter" 
$sysmain = Servico "SysMain" 
$superfetch = Servico "Superfecth" 
$telefonia = Servico "TapiSrv" 
$biometria = Servico "WbioSrvc" 
$wsearch = Servico "WSearch" 
$wupdate = Servico "wuauserv" 
$nfc = Servico "SEMgrSvc"

$xb_auth = Servico "XblAuthManager" 
$xb_gs = Servico "SblGameSave" 
$xb_gip = Servico "XboxGipSvc" 
$xb_api = Servico "XboxNetApiSvc" 




# 2. Registre o servico na lista abaixo
$ServiceRegistry =@{
	bonjour=$bonjour;
	amds=$amds;
	hamachi=$hamachi;
	postgres=$postgres;
	sqlwriter=$sqlwriter;
	sysmain=$sysmain;
	superfetch=$superfetch;
	telefonia=$telefonia;
	biometria=$biometria;
	wsearch=$wsearch;
	wupdate=$wupdate;
	xb_auth=$xb_auth;
	xb_gs=$xb_gs;
	xb_gip=$xb_gip;
	xb_api=$xb_api;
	nfc=$nfc;
	logmein=$logmein#;
	#nome=$nome
	# Não esqueça de colocar o ; [Ponto e Virgula] após cada linha (exceto a ultima)
}



#############################
#### Serviços Opcionais #####
#############################

$opt_intelhdg = Servico "igfxCUIService2.0.0.0" #Intel HD Graphics (Use se não utilizar da placa dedicada INTEL)


$OptServiceRegistry =@
{
	opt_intelhdg=$opt_intelhdg
}

function KillProc
{
	param($proc)
	echo "[Process] Killed $($proc.Name)"
	$proc.CloseMainWindow();
	Sleep 2
	if(!$proc.HasExited)
	{
		$proc | Stop-Process -Force
	}
}
function KillSrvc
{
	param($proc)
	echo "[Service] Killed $($proc.Name)"
	Stop-Service $proc -Force;
	
}

ForEach ($v in $ProcRegistry.Values)
{
	if($v)
	{
		KillProc $v
	}
}

ForEach ($v in $ServiceRegistry.Values)
{
	if($v)
	{
		KillSrvc $v
	}
}

##
## Remova as '#' (Hashtags) nas linhas a seguir se quiser
## que as alterações opcionais entem em efeito.
##

# ForEach ($v in $OptServiceRegistry.Values)
# {
#  		if($v)
#		{
#			KillSrvc $v
#		}
# }
echo "Kebab Removed Sucessfully"
