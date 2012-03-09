{include file="documentHeader"}
<head>
	<title>{lang}wcf.minecraft.map.title{/lang} - {lang}{PAGE_TITLE}{/lang}</title>
	{include file='headInclude' sandbox=false}
</head>
<body{if $templateName|isset} id="tpl{$templateName|ucfirst}"{/if}>
{include file='header' sandbox=false}

<div id="main">
	<ul class="breadCrumbs">
		<li><a href="index.php?page=Index{@SID_ARG_2ND}"><img src="{icon}indexS.png{/icon}" alt="" /> <span>{lang}{PAGE_TITLE}{/lang}</span></a> &raquo;</li>
	</ul>

	<div class="mainHeadline">
		<img src="{icon}minecraftMapL.png{/icon}" alt="" />
		<div class="headlineContainer">
			<h2>{lang}wcf.minecraft.map.title{/lang}</h2>
			<p>{lang}wcf.minecraft.map.description{/lang}</p>
		</div>
	</div>
	
	{if $userMessages|isset}{@$userMessages}{/if}
	
	{if MINECRAFT_MAP_URL && $checkMinecraftMapOnline==true}
		<div class="border content">
			<iframe style="width: 100%; border: 0 none; display: block; height: {MINECRAFT_MAP_HEIGHT}px;" class="container-1" src="{MINECRAFT_MAP_URL}"></iframe>
		</div>
		{if MINECRAFT_MAP_URL_SHOW}<div class="info">{lang}wcf.minecraft.map.url{/lang}<a href="{MINECRAFT_MAP_URL}" class="externalURL" style="background-image:none;">{MINECRAFT_MAP_URL}</a></div>{/if}
	{else}
		<div class="warning">{lang}wcf.minecraft.map.error{/lang}</div>
	{/if}
</div>

{include file='footer' sandbox=false}
</body>
</html>