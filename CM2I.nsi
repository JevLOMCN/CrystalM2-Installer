!include LogicLib.nsh
!include MUI.nsh

;Installer Config
RequestExecutionLevel Admin
!define VERSION "1.2.0.0"
!define APP_NAME "CrystalM2"
!define MUI_ICON "C:\path\to\ICON.ICO"
Name "${APP_NAME} v${VERSION}"
Outfile "${APP_NAME}_${VERSION}.exe"
InstallDir "$PROGRAMFILES64\${APP_NAME}"
VIProductVersion "${VERSION}"
ShowInstDetails show

;Pre-Requisite URLs
!define NET8_URL "https://download.visualstudio.microsoft.com/download/pr/76e5dbb2-6ae3-4629-9a84-527f8feb709c/09002599b32d5d01dc3aa5dcdffcc984/windowsdesktop-runtime-8.0.6-win-x64.exe"
!define DXSDK_URL "https://download.microsoft.com/download/A/E/7/AE743F1F-632B-4809-87A9-AA1BB3458E31/DXSDK_Jun10.exe"
!define VCR13_URL "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
!define WV2_URL "https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/959354ef-4cbd-4c8b-92b9-2b67f16f8974/MicrosoftEdgeWebView2RuntimeInstallerX64.exe"

;Crystal files URLs
!define SCCM2_URL "https://github.com/meacher0/Crystal/releases/download/v2024.06.14/Crystal_14.06.2024_Debug.zip"
!define DB_URL "https://github.com/meacher0/Crystal.Database/releases/download/v1.0.0.0/JevCrystalDB.zip"

;Useful URLs
!define HELP_URL "https://www.lomcn.net/wiki/index.php/Crystal"
!define ABOUT_URL "https://github.com/meacher0/CrystalM2-Installer"

;Client/Server Network Config
!define CLIENT_IP "127.0.0.1"
!define CLIENT_PORT "7000"
!define SERVER_IP "0.0.0.0"
!define SERVER_PORT "7000"

;Language Codes
!define LANG_ENGLISH "1033"
!define LANG_CHINESE "1028"
!define LANG_KOREAN "1042"


;English Installer Information
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${APP_NAME} Setup"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "${APP_NAME} Setup Application"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "©${APP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${APP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "${APP_NAME}® is a trademark of ${APP_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${APP_NAME} Installer Application"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${VERSION}" 
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${VERSION}"

;Chinese Installer Information
VIAddVersionKey /LANG=${LANG_CHINESE} "ProductName" "${APP_NAME} 安裝"
VIAddVersionKey /LANG=${LANG_CHINESE} "Comments" "${APP_NAME} 安裝應用程式"
VIAddVersionKey /LANG=${LANG_CHINESE} "LegalCopyright" "©${APP_NAME}"
VIAddVersionKey /LANG=${LANG_CHINESE} "CompanyName" "${APP_NAME}"
VIAddVersionKey /LANG=${LANG_CHINESE} "LegalTrademarks" "${APP_NAME}® 是 ${APP_NAME} 的商標"
VIAddVersionKey /LANG=${LANG_CHINESE} "FileDescription" "${APP_NAME} 安裝程式"
VIAddVersionKey /LANG=${LANG_CHINESE} "FileVersion" "${VERSION}" 
VIAddVersionKey /LANG=${LANG_CHINESE} "ProductVersion" "${VERSION}"

;Korean Installer Information
VIAddVersionKey /LANG=${LANG_KOREAN} "ProductName" "${APP_NAME} 설치"
VIAddVersionKey /LANG=${LANG_KOREAN} "Comments" "${APP_NAME} 설치 응용 프로그램"
VIAddVersionKey /LANG=${LANG_KOREAN} "LegalCopyright" "©${APP_NAME}"
VIAddVersionKey /LANG=${LANG_KOREAN} "CompanyName" "${APP_NAME}"
VIAddVersionKey /LANG=${LANG_KOREAN} "LegalTrademarks" "${APP_NAME}®은(는) ${APP_NAME}의 상표입니다."
VIAddVersionKey /LANG=${LANG_KOREAN} "FileDescription" "${APP_NAME} 설치 프로그램"
VIAddVersionKey /LANG=${LANG_KOREAN} "FileVersion" "${VERSION}" 
VIAddVersionKey /LANG=${LANG_KOREAN} "ProductVersion" "${VERSION}"

;Add Modern User Interface (MUI)
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

;MUI Language Strings
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "TradChinese"
!insertmacro MUI_LANGUAGE "Korean"

;Components Page English Language Strings
LangString DESC_GPR ${LANG_ENGLISH} "The Runtimes and Redistributables required for the CrystalM2 Server and Client to run successfully."
LangString DESC_DN8 ${LANG_ENGLISH} "Install the dotNet v8.0.6 Desktop Runtime. CrystalM2 uses some dotNET 8 code and libraries to function."
LangString DESC_VC13 ${LANG_ENGLISH} "Install the Visual C++ 2013 Redistributable. CrystalM2 uses some C++ 2013 code and libraries to function."
LangString DESC_WV2 ${LANG_ENGLISH} "Install the Microsoft WebView2 Runtime. The CrystalM2 Client uses WebView to display the autopatchers webpage. NOTE: Not required on Windows 11."
LangString DESC_GCF ${LANG_ENGLISH} "The Open-Source CrystalM2 Binaries and libraries required to begin setup of your CrystalM2 Game Server."
LangString DESC_CMF ${LANG_ENGLISH} "This will Download and Install the CrystalM2 Server and Client Core binaries and files. These are the base files required to begin configuring a CrystalM2 Server."
LangString DESC_GCC ${LANG_ENGLISH} "The Automatic Configuration of the CrystalM2 Server with various settings"
LangString DESC_JDB ${LANG_ENGLISH} "The CrystalM2 Server needs to be configured before the game can be played. This will download and use JevLOMCN's Pre-configured database and files to aid initial Server setup."
LangString DESC_SCN ${LANG_ENGLISH} "Set the Client to connect to IP ${CLIENT_IP}:${CLIENT_PORT}"
LangString DESC_ECH ${LANG_ENGLISH} "Set the location of the client executable that the server will use to confirm connecting clients are the same version."
LangString DESC_SLI ${LANG_ENGLISH} "Set the server's IP address to 0.0.0.0 to allow LAN play and WAN play. NOTE: WAN play may require additional networking configuration."
LangString DESC_ACC ${LANG_ENGLISH} "Allow creation of user accounts."
LangString DESC_ASG ${LANG_ENGLISH} "Allow characters to enter the game world after creating an account and character."
LangString DESC_AAA ${LANG_ENGLISH} "Allow the creation of the Archer and Assassin classes."
LangString DESC_MRH ${LANG_ENGLISH} "Increase the maximum allowed game resolution to 1920x1080."
LangString DESC_SZH ${LANG_ENGLISH} "Create a border around in-game Safe Zones to help with visibility. Also Heal any players inside a Safe Zone." 
LangString DESC_GMP ${LANG_ENGLISH} "Replace the default CrystalM2 GM Password used to elevate permissions of a player character to GameMaster. A popup will appear during installation with the new password."
LangString DESC_GCS ${LANG_ENGLISH} "Create quick access shortcuts to aid in quickly locating various parts of CrystalM2."
LangString DESC_CDC ${LANG_ENGLISH} "Create a shortcut to the Game Client executable on the desktop."
LangString DESC_CDS ${LANG_ENGLISH} "Create a shortcut to the Game Server executable on the desktop."
LangString DESC_CSMC ${LANG_ENGLISH} "Create a shortcut to the Game Client executable in the Start Menu."
LangString DESC_CSMS ${LANG_ENGLISH} "Create a shortcut to the Game Server executable in the Start Menu."
LangString DESC_CSMV ${LANG_ENGLISH} "Create a shortcut to the Library Viewer Tool executable in the Start Menu."
LangString DESC_CSME ${LANG_ENGLISH} "Create a shortcut to the Library Editor Tool in the Start Menu."
LangString DESC_CSMD ${LANG_ENGLISH} "Create a shortcut to the Server Directory in the Start Menu."
LangString DESC_WFW ${LANG_ENGLISH} "Add a firewall rule for the Server to allow inbound traffic from LAN."
LangString DESC_GUN ${LANG_ENGLISH} "Options for uninstallation and clean-up when you are finished with your CrystalM2 server."
LangString DESC_UNI ${LANG_ENGLISH} "Add infomation about CrystalM2 to Add/Remove Programs of the windows control panel. CrystalM2 can be uninstalled from the control panel."
LangString DESC_UDS ${LANG_ENGLISH} "Create a Desktop shortcut to easily uninstall CrystalM2."
LangString DESC_USM ${LANG_ENGLISH} "Create a Start Menu shortcut to easily uninstall CrystalM2."

;MessageBox English Language Strings
LangString MSGB_DLF ${LANG_ENGLISH} "Download Failed...$\nCheck Internet Connection Settings.$\nClick Retry to attempt the download again."
LangString MSGB_GMP ${LANG_ENGLISH} "A new GM Password has been generated.$\n$\nGM Password: $2 $\n$\nUse the @login game command to elevate charater.$\nThe password can be updated by editing Setup.ini located in:$\n $INSTDIR\Server\Configs"
LangString MSGB_AIN ${LANG_ENGLISH} "A Selected Pre-Requisite is already installed, continuing . . ."

;DetailPrint English Language Strings
LangString DPRNT_DWN ${LANG_ENGLISH} "Downloading Pre-Requisite . . ."
LangString DPRNT_INS ${LANG_ENGLISH} "Installing Pre-Requisite . . ."
LangString DPRNT_DLC ${LANG_ENGLISH} "Downloading CrystalM2 Core Files . . ."
LangString DPRNT_CLN ${LANG_ENGLISH} "Cleaning up . . ."
LangString DPRNT_JDB ${LANG_ENGLISH} "Downloading Jev's DB Files . . ."

; Components Page Chinese Language Strings
LangString DESC_GPR ${LANG_CHINESE} "CrystalM2 服务器和客户端运行所需的运行时和分发包。"
LangString DESC_DN8 ${LANG_CHINESE} "安装 dotNet v8.0.6 桌面运行时。CrystalM2 使用一些 dotNET 8 代码和库来运行。"
LangString DESC_VC13 ${LANG_CHINESE} "安装 Visual C++ 2013 Redistributable。CrystalM2 使用一些 C++ 2013 代码和库来运行。"
LangString DESC_WV2 ${LANG_CHINESE} "安装 Microsoft WebView2 运行时。CrystalM2 客户端使用 WebView 来显示自动补丁程序的网页。注意：在 Windows 11 上不需要。"
LangString DESC_GCF ${LANG_CHINESE} "开源的 CrystalM2 二进制文件和库，用于开始设置 CrystalM2 游戏服务器。"
LangString DESC_CMF ${LANG_CHINESE} "这将下载并安装 CrystalM2 服务器和客户端的核心二进制文件和文件。这些是开始配置 CrystalM2 服务器所需的基本文件。"
LangString DESC_GCC ${LANG_CHINESE} "CrystalM2 服务器的自动配置，包括各种设置。"
LangString DESC_JDB ${LANG_CHINESE} "在游戏开始之前，需要配置 CrystalM2 服务器。这将下载并使用 JevLOMCN 的预配置数据库和文件，以帮助进行初始服务器设置。"
LangString DESC_SCN ${LANG_CHINESE} "将客户端设置为连接到 IP ${CLIENT_IP}:${CLIENT_PORT}"
LangString DESC_ECH ${LANG_CHINESE} "设置服务器将用于确认连接的客户端是否是相同版本的客户端可执行文件的位置。"
LangString DESC_SLI ${LANG_CHINESE} "将服务器的 IP 地址设置为 0.0.0.0，以允许局域网和广域网游戏。注意：广域网游戏可能需要额外的网络配置。"
LangString DESC_ACC ${LANG_CHINESE} "允许创建用户帐户。"
LangString DESC_ASG ${LANG_CHINESE} "允许角色在创建帐户和角色后进入游戏世界。"
LangString DESC_AAA ${LANG_CHINESE} "允许创建弓箭手和刺客职业。"
LangString DESC_MRH ${LANG_CHINESE} "将允许的最大游戏分辨率增加到 1920x1080。"
LangString DESC_SZH ${LANG_CHINESE} "在游戏内安全区域周围创建边框，以提高可见性。还会治疗安全区域内的玩家。" 
LangString DESC_GMP ${LANG_CHINESE} "替换用于将玩家角色权限提升为游戏管理员的默认 CrystalM2 GM 密码。在安装过程中会弹出一个新密码。"
LangString DESC_GCS ${LANG_CHINESE} "创建快速访问快捷方式，以帮助快速定位 CrystalM2 的各个部分。"
LangString DESC_CDC ${LANG_CHINESE} "在桌面上创建游戏客户端可执行文件的快捷方式。"
LangString DESC_CDS ${LANG_CHINESE} "在桌面上创建游戏服务器可执行文件的快捷方式。"
LangString DESC_CSMC ${LANG_CHINESE} "在开始菜单中创建游戏客户端可执行文件的快捷方式。"
LangString DESC_CSMS ${LANG_CHINESE} "在开始菜单中创建游戏服务器可执行文件的快捷方式。"
LangString DESC_CSMV ${LANG_CHINESE} "在开始菜单中创建库查看器工具可执行文件的快捷方式。"
LangString DESC_CSME ${LANG_CHINESE} "在开始菜单中创建库编辑器工具的快捷方式。"
LangString DESC_CSMD ${LANG_CHINESE} "在开始菜单中创建服务器目录的快捷方式。"
LangString DESC_WFW ${LANG_CHINESE} "为服务器添加防火墙规则，允许来自局域网的入站流量。"
LangString DESC_GUN ${LANG_CHINESE} "完成 CrystalM2 服务器后的卸载和清理选项。"
LangString DESC_UNI ${LANG_CHINESE} "将 CrystalM2 的信息添加到 Windows 控制面板的“添加/删除程序”中。可以从控制面板卸载 CrystalM2。"
LangString DESC_UDS ${LANG_CHINESE} "创建一个桌面快捷方式，以便轻松卸载 CrystalM2。"
LangString DESC_USM ${LANG_CHINESE} "在开始菜单中创建一个快捷方式，以便轻松卸载 CrystalM2。"

;MessageBox Chinese Language Strings
LangString MSGB_DLF ${LANG_CHINESE} "下载失败...$\n请检查网络连接设置。$\n点击重试以重新尝试下载。"
LangString MSGB_GMP ${LANG_CHINESE} "已生成新的 GM 密码。$\n$\nGM 密码：$2 $\n$\n使用 @login 游戏命令提升角色权限。密码可以通过编辑位于：$\n $INSTDIR\Server\Configs 的 Setup.ini 来更新。"
LangString MSGB_AIN ${LANG_CHINESE} "所选的先决条件已安装，继续...。"

;DetailPrint Chinese Language Strings
LangString DPRNT_DWN ${LANG_CHINESE} "正在下载先决条件...。"
LangString DPRNT_INS ${LANG_CHINESE} "正在安装先决条件...。"
LangString DPRNT_DLC ${LANG_CHINESE} "正在下载 CrystalM2 核心文件...。"
LangString DPRNT_CLN ${LANG_CHINESE} "正在清理...。"
LangString DPRNT_JDB ${LANG_CHINESE} "正在下载 Jev 的数据库文件...。"

; Components Page Korean Language Strings
LangString DESC_GPR ${LANG_KOREAN} "CrystalM2 서버 및 클라이언트가 성공적으로 실행되기 위해 필요한 런타임 및 리디스트리뷰터블입니다."
LangString DESC_DN8 ${LANG_KOREAN} "dotNet v8.0.6 데스크톱 런타임을 설치하세요. CrystalM2는 일부 dotNET 8 코드와 라이브러리를 사용합니다."
LangString DESC_VC13 ${LANG_KOREAN} "Visual C++ 2013 리디스트리뷰터블을 설치하세요. CrystalM2는 일부 C++ 2013 코드와 라이브러리를 사용합니다."
LangString DESC_WV2 ${LANG_KOREAN} "Microsoft WebView2 런타임을 설치하세요. CrystalM2 클라이언트는 자동 패처 웹페이지를 표시하는 데 WebView를 사용합니다. 참고: Windows 11에서는 필요하지 않습니다."
LangString DESC_GCF ${LANG_KOREAN} "CrystalM2 게임 서버 설정을 시작하기 위해 필요한 오픈 소스 CrystalM2 바이너리 및 라이브러리입니다."
LangString DESC_CMF ${LANG_KOREAN} "CrystalM2 서버 및 클라이언트 코어 바이너리 및 파일을 다운로드하고 설치합니다. 이것들은 CrystalM2 서버를 구성하기 위해 필요한 기본 파일입니다."
LangString DESC_GCC ${LANG_KOREAN} "다양한 설정으로 CrystalM2 서버를 자동으로 구성합니다."
LangString DESC_JDB ${LANG_KOREAN} "게임을 플레이하기 전에 CrystalM2 서버를 구성해야 합니다. 이것은 초기 서버 설정을 돕기 위해 JevLOMCN의 사전 구성된 데이터베이스 및 파일을 다운로드하고 사용합니다."
LangString DESC_SCN ${LANG_KOREAN} "클라이언트를 IP ${CLIENT_IP}:${CLIENT_PORT}에 연결하도록 설정합니다."
LangString DESC_ECH ${LANG_KOREAN} "서버가 연결 중인 클라이언트의 버전을 확인하기 위해 클라이언트 실행 파일의 위치를 설정합니다."
LangString DESC_SLI ${LANG_KOREAN} "서버의 IP 주소를 0.0.0.0으로 설정하여 LAN 플레이와 WAN 플레이를 허용합니다. 참고: WAN 플레이는 추가 네트워킹 구성이 필요할 수 있습니다."
LangString DESC_ACC ${LANG_KOREAN} "사용자 계정 생성을 허용합니다."
LangString DESC_ASG ${LANG_KOREAN} "계정 및 캐릭터 생성 후 캐릭터가 게임 세계에 진입할 수 있도록 허용합니다."
LangString DESC_AAA ${LANG_KOREAN} "아처 및 어쌔신 클래스 생성을 허용합니다."
LangString DESC_MRH ${LANG_KOREAN} "최대 허용 게임 해상도를 1920x1080으로 늘립니다."
LangString DESC_SZH ${LANG_KOREAN} "게임 내 안전 지역 주변에 테두리를 생성하여 가시성을 높입니다. 또한 안전 지역 내의 플레이어를 치유합니다."
LangString DESC_GMP ${LANG_KOREAN} "플레이어 캐릭터의 권한을 게임 마스터로 상승시키기 위해 기본 CrystalM2 GM 암호를 대체합니다. 설치 중에 새 암호가 팝업으로 표시됩니다."
LangString DESC_GCS ${LANG_KOREAN} "CrystalM2의 다양한 부분을 빠르게 찾기 위해 빠른 액세스 바로 가기를 생성합니다."
LangString DESC_CDC ${LANG_KOREAN} "데스크톱에서 게임 클라이언트 실행 파일에 대한 바로 가기를 생성합니다."
LangString DESC_CDS ${LANG_KOREAN} "데스크톱에서 게임 서버 실행 파일에 대한 바로 가기를 생성합니다."
LangString DESC_CSMC ${LANG_KOREAN} "시작 메뉴에서 게임 클라이언트 실행 파일에 대한 바로 가기를 생성합니다."
LangString DESC_CSMS ${LANG_KOREAN} "시작 메뉴에서 게임 서버 실행 파일에 대한 바로 가기를 생성합니다."
LangString DESC_CSMV ${LANG_KOREAN} "시작 메뉴에서 라이브러리 뷰어 도구 실행 파일에 대한 바로 가기를 생성합니다."
LangString DESC_CSME ${LANG_KOREAN} "시작 메뉴에서 라이브러리 편집기 도구에 대한 바로 가기를 생성합니다."
LangString DESC_CSMD ${LANG_KOREAN} "시작 메뉴에서 서버 디렉토리에 대한 바로 가기를 생성합니다."
LangString DESC_WFW ${LANG_KOREAN} "서버에 LAN에서 들어오는 트래픽을 허용하기 위해 방화벽 규칙을 추가합니다."
LangString DESC_GUN ${LANG_KOREAN} "CrystalM2 서버 사용이 완료되면 제거 및 정리 옵션입니다."
LangString DESC_UNI ${LANG_KOREAN} "Windows 제어판의 추가/제거 프로그램에 CrystalM2 정보를 추가합니다. CrystalM2는 제어판에서 제거할 수 있습니다."
LangString DESC_UDS ${LANG_KOREAN} "CrystalM2를 쉽게 제거하기 위한 데스크톱 바로 가기를 생성합니다."
LangString DESC_USM ${LANG_KOREAN} "CrystalM2를 쉽게 제거하기 위한 시작 메뉴 바로 가기를 생성합니다."

;MessageBox Korean Language Strings
LangString MSGB_DLF ${LANG_KOREAN} "다운로드 실패...$\n인터넷 연결 설정을 확인하세요.$\n다시 다운로드를 시도하려면 '재시도'를 클릭하세요."
LangString MSGB_GMP ${LANG_KOREAN} "새 GM 암호가 생성되었습니다.$\n$\nGM 암호: $2 $\n$\n@login 게임 명령을 사용하여 캐릭터 권한을 상승시키세요.$\n암호는 다음 위치의 Setup.ini를 편집하여 업데이트할 수 있습니다:$\n $INSTDIR\Server\Configs"
LangString MSGB_AIN ${LANG_KOREAN} "선택한 사전 요구 사항이 이미 설치되어 있습니다. 계속 진행합니다. . ."

;DetailPrint Korean Language Strings
LangString DPRNT_DWN ${LANG_KOREAN} "사전 요구 사항 다운로드 중 . . ."
LangString DPRNT_INS ${LANG_KOREAN} "사전 요구 사항 설치 중 . . ."
LangString DPRNT_DLC ${LANG_KOREAN} "CrystalM2 핵심 파일 다운로드 중 . . ."
LangString DPRNT_CLN ${LANG_KOREAN} "정리 중 . . ."
LangString DPRNT_JDB ${LANG_KOREAN} "Jev의 DB 파일 다운로드 중 . . ."


SectionGroup "Pre-Requisites" GPR

Section "dotNET 8.0.6 Runtime" DN8

	retry_dn_download:
		ReadRegStr $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{942f6911-1a02-4186-8c4c-b27eb2b9733d}" "Version"
		${If} $0 != "8.0.6.33720"
			DetailPrint "$(DPRNT_DWN)"
			NScurl::http get "${NET8_URL}" "$TEMP\cm2\dotnet8.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "$(DPRNT_INS)"
				ExecWait '"$TEMP\cm2\dotnet8.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_dn_download
				Abort 
			${EndIf}
		${Else}
		MessageBox MB_ICONINFORMATION "$(MSGB_AIN)"
		${EndIf}
		
SectionEnd

Section "C++ Redist. 2013 Runtime" VC13

	retry_vc_download:
		ReadRegDWORD $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f}" "Version"
		${If} $0 != "12.0.30501.0"
			DetailPrint "$(DPRNT_DWN)"
			NScurl::http get "${VCR13_URL}" "$TEMP\cm2\vcredist_x64.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "$(DPRNT_INS)"
				ExecWait '"$TEMP\cm2\vcredist_x64.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_vc_download
				Abort 
			${EndIf}
		${Else}
		MessageBox MB_ICONINFORMATION "$(MSGB_AIN)"
		${EndIf}
		
SectionEnd

Section "WebView2 Runtime" WV2

	retry_wv_download:
		ReadRegStr $0 HKLM "SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}" "pv"
		${If} $0 == "0"
			DetailPrint "$(DPRNT_DWN)"
			NScurl::http get "${WV2_URL}" "$TEMP\cm2\webview2.exe" /CANCEL /RESUME /END
			Pop $R0
			${If} $R0 == "OK"
				DetailPrint "$(DPRNT_INS)"
				ExecWait '"$TEMP\cm2\webview2.exe" /install /quiet'
			${Else}
				MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_wv_download
				Abort 
			${EndIf}
		${Else}
		MessageBox MB_ICONINFORMATION "$(MSGB_AIN)"
		${EndIf}
		
SectionEnd

SectionGroupEnd


SectionGroup "CrystalM2 Files" GCF

Section "CrystalM2 Core" CMF

    SetOutPath $INSTDIR
	CreateDirectory $INSTDIR
	AccessControl::GrantOnFile $INSTDIR "(S-1-5-32-545)" "FullAccess"
	
	retry_cm_download:
		DetailPrint "$(DPRNT_DLC)"
		NScurl::http get "${SCCM2_URL}" "$TEMP\cm2\build.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			nsisunz::UnzipToLog "$TEMP\cm2\build.zip" "$TEMP\cm2\crystal"
			CopyFiles "$TEMP\cm2\crystal\Crystal_14.06.2024_Debug\*" $INSTDIR
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_cm_download
			Abort 
		${EndIf}			 

	DetailPrint "$(DPRNT_CLN)"
	RMDir /r "$TEMP\cm2"
	
SectionEnd

SectionGroupEnd


SectionGroup "Crystal Configuration" GCC

Section "Use Jev's DB" JDB

	retry_db_download:
		DetailPrint "$(DPRNT_JDB)"
		NScurl::http get "${DB_URL}" "$TEMP\cm2\data.zip" /CANCEL /RESUME /END
		Pop $R0
		${If} $R0 == "OK"
			nsisunz::UnzipToLog "$TEMP\cm2\data.zip" "$TEMP\cm2\extra"
			CopyFiles "$TEMP\cm2\extra\*" "$INSTDIR\Server"
		${Else}
			MessageBox MB_ICONEXCLAMATION|MB_RETRYCANCEL "$(MSGB_DLF)" IDRETRY retry_db_download
			Abort 
		${EndIf}
			
	DetailPrint "$(DPRNT_CLN)"
	RMDir /r "$TEMP\cm2"
	
SectionEnd

Section "Set Client Networking" SCN

	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "UseConfig" "True"
	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "IPAddress" "${CLIENT_IP}"
	WriteINIStr "$INSTDIR\Client\Mir2Test.ini" "Network" "Port" "${CLIENT_PORT}"	
	
SectionEnd
	
Section "Enforce Client Hash" ECH
	
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "General" "VersionPath" "$INSTDIR\Client\Client.exe"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "General" "CheckVersion" "True"
	
SectionEnd

Section "Set Server IP for LAN play" SLI

	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Network" "IPAddress" "${SERVER_IP}"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Network" "Port" "${SERVER_PORT}"

SectionEnd
	
Section "Allow Character Creation" ACC

	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowNewAccount" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowChangePassword" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowLogin" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowNewCharacter" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowDeleteCharacter" "True"
	
SectionEnd
	
Section "Allow Starting Game" ASG

	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowStartGame" "True"

SectionEnd
	
Section "Allow Archer/Assassin" AAA

	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowCreateAssassin" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "AllowCreateArcher" "True"

SectionEnd

Section "Max Resolution 1920x1080" MRH

	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Permission" "MaxResolution" "1920"
	
SectionEnd
	
Section "SafeZone Border/Healing" SZH

	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Optional" "SafeZoneBorder" "True"
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "Optional" "SafeZoneHealing" "True"
	
SectionEnd

Section "Generate GM Password" GMP

	StrCpy $2 ""
	badrange:
		System::Call 'advapi32::SystemFunction036(*i0r0,i1)'
		IntCmpU $0 127 "" ""  badrange 
		System::Call 'user32::IsCharAlphaNumericA(ir0)i.r1'
		StrCmp $1 0 badrange
		IntFmt $0 "%c" $0
		StrCpy $2 "$2$0"
		StrLen $0 $2
		IntCmpU $0 10 "" badrange
	DetailPrint $2
	
	WriteINIStr "$INSTDIR\Server\Configs\Setup.ini" "General" "GMPassword" "$2"
	
	MessageBox MB_ICONINFORMATION "$(MSGB_GMP)"
	DetailPrint "GM Password: $2"
	
SectionEnd

SectionGroupEnd


SectionGroup "Create Shortcuts" GCS

Section "Desktop: Client" CDC

	SetOutPath "$INSTDIR\Client" 
    CreateShortcut "$DESKTOP\${APP_NAME} Client.lnk" "$INSTDIR\Client\Client.exe"
	
SectionEnd

Section "Desktop: Server" CDS

	SetOutPath "$INSTDIR\Server"
    CreateShortcut "$DESKTOP\${APP_NAME} Server.lnk" "$INSTDIR\Server\Server.exe"

SectionEnd

Section "StartMenu: Client" CSMC

	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR\Client"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\${APP_NAME} Client.lnk" "$INSTDIR\Client\Client.exe"
	
SectionEnd

Section "StartMenu: Server" CSMS
	
	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR\Server"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\${APP_NAME} Server.lnk" "$INSTDIR\Server\Server.exe"

SectionEnd
	
Section "StartMenu: Lib Viewer" CSMV

	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR\Server Tools\LibraryViewer"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Library Viewer.lnk" "$INSTDIR\Server Tools\LibraryViewer\CMirLibraryViewer.exe"

SectionEnd

Section "StartMenu: Lib Editor" CSME

	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR\Server Tools\LibraryEditor"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Library Editor.lnk" "$INSTDIR\Server Tools\LibraryEditor\LibraryEditor.exe"

SectionEnd

Section "StartMenu: Server Dir" CSMD

	CreateDirectory "$SMPROGRAMS\${APP_NAME}"
	SetOutPath "$INSTDIR\Server"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Server Directory.lnk" "$INSTDIR\Server"

SectionEnd

SectionGroupEnd


Section "Add Firewall Rule" WFW

	ExecWait 'netsh advfirewall firewall add rule name="${APP_NAME}" dir=in program="$INSTDIR\Server\Server.exe" remoteip=localsubnet action=allow profile=public,private'

SectionEnd


SectionGroup "Uninstaller" GUN

Section "Add/Remove Programs" UNI

	WriteUninstaller "$INSTDIR\uninstall.exe"

	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "DisplayName" "${APP_NAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "HelpLink" "${HELP_URL}"	
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "URLInfoAbout" "${ABOUT_URL}"				 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" \
                 "DisplayVersion" "${VERSION}"	
				 
SectionEnd

Section "Desktop Shortcut" UDS

	SetOutPath "$INSTDIR"
    CreateShortcut "$DESKTOP\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section "StartMenu Shortcut" USM

	SetOutPath "$INSTDIR"
	CreateShortcut "$SMPROGRAMS\${APP_NAME}\Uninstall ${APP_NAME}.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

SectionGroupEnd


Section "un.Uninstall Section"

	RMDir /r "$SMPROGRAMS\${APP_NAME}"
	
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
	
	ExecWait 'netsh advfirewall firewall delete rule name="${APP_NAME}"'
	
	Delete "$DESKTOP\${APP_NAME} Client.lnk"
    Delete "$DESKTOP\${APP_NAME} Server.lnk"
	Delete "$DESKTOP\Uninstall ${APP_NAME}.lnk"
 
	RMDir /r "$INSTDIR"
	
SectionEnd


Function .OnInit

	;Set approx size for RequiredSize calculation
	SectionSetSize ${DN8} 160000
	SectionSetSize ${VC13} 31000
	SectionSetSize ${WV2} 190000
	SectionSetSize ${CMF} 160000
	SectionSetSize ${JDB} 950000
	SectionSetSize ${UNI} 2000
	
	;Set Core Server/Client as required for install
	SectionSetFlags ${CMF} 17
	
	;Show Language choice at start
	!insertmacro MUI_LANGDLL_DISPLAY
	
FunctionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN

	;Add description text on components page using language strings
	!insertmacro MUI_DESCRIPTION_TEXT ${GPR} $(DESC_GPR) ;group - pre-requisites
	!insertmacro MUI_DESCRIPTION_TEXT ${DN8} $(DESC_DN8) ; dotnet 8
	!insertmacro MUI_DESCRIPTION_TEXT ${VC13} $(DESC_VC13) ;vc redist
	!insertmacro MUI_DESCRIPTION_TEXT ${WV2} $(DESC_WV2) ; webview2
	!insertmacro MUI_DESCRIPTION_TEXT ${GCF} $(DESC_GCF) ;group crystal files
	!insertmacro MUI_DESCRIPTION_TEXT ${CMF} $(DESC_CMF) ;crystalM2 core files
	!insertmacro MUI_DESCRIPTION_TEXT ${GCC} $(DESC_GCC) ;group - crystal config
	!insertmacro MUI_DESCRIPTION_TEXT ${JDB} $(DESC_JDB) ; Jev's DB	
	!insertmacro MUI_DESCRIPTION_TEXT ${SCN} $(DESC_SCN) ; set client network
	!insertmacro MUI_DESCRIPTION_TEXT ${ECH} $(DESC_ECH) ; set client hash on serv
	!insertmacro MUI_DESCRIPTION_TEXT ${SLI} $(DESC_SLI) ; set server ip 0.0.0.0
	!insertmacro MUI_DESCRIPTION_TEXT ${ACC} $(DESC_ACC) ; allow create char stuff
	!insertmacro MUI_DESCRIPTION_TEXT ${ASG} $(DESC_ASG) ; allow start game
	!insertmacro MUI_DESCRIPTION_TEXT ${AAA} $(DESC_AAA) ; allow sin/arch
	!insertmacro MUI_DESCRIPTION_TEXT ${MRH} $(DESC_MRH) ; set max res 1920
	!insertmacro MUI_DESCRIPTION_TEXT ${SZH} $(DESC_SZH) ; safezone
	!insertmacro MUI_DESCRIPTION_TEXT ${GMP} $(DESC_GMP) ; generate GM pass
	!insertmacro MUI_DESCRIPTION_TEXT ${GCS} $(DESC_GCS) ; group - create shortcuts
	!insertmacro MUI_DESCRIPTION_TEXT ${CDC} $(DESC_CDC) ; client desktop shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CDS} $(DESC_CDS) ; Server desktop shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMC} $(DESC_CSMC) ; Client Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMS} $(DESC_CSMS) ; Server Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMV} $(DESC_CSMV) ; LibViewer Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSME} $(DESC_CSME) ; LibEditor Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${CSMD} $(DESC_CSMD) ; ServerDir Startmenu shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${WFW} $(DESC_WFW) ; windows firewall rule
	!insertmacro MUI_DESCRIPTION_TEXT ${GUN} $(DESC_GUN) ; Group - uninstaller
	!insertmacro MUI_DESCRIPTION_TEXT ${UNI} $(DESC_UNI) ; add/rem progs info
	!insertmacro MUI_DESCRIPTION_TEXT ${UDS} $(DESC_UDS) ; uninstaller desktop shortcut
	!insertmacro MUI_DESCRIPTION_TEXT ${USM} $(DESC_USM) ; uninstaller startmenu shortcut
	
!insertmacro MUI_FUNCTION_DESCRIPTION_END