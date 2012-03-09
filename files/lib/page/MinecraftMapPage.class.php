<?php
// wcf imports
require_once(WCF_DIR.'lib/page/AbstractPage.class.php');

/**
 * Shows the Minecraft Map.
 * 
 * @svn			$Id: MinecraftMapPage.class.php 1910 2012-03-09 18:39:15Z TobiasH87 $
 * @package		de.community4wcf.wcf.page.minecraft.map
 */

class MinecraftMapPage extends AbstractPage {
	// system
	public $templateName = 'minecraftMap';

	public $checkMinecraftMapOnline = false;
	
	/**
	 * @see Page::assignVariables()
	 */
	public function assignVariables() {
		parent::assignVariables();
		
		WCF::getTPL()->assign(array('checkMinecraftMapOnline' => true));
		
		// check Map is online
		$fqdn = MINECRAFT_MAP_FQDN;
		$port = MINECRAFT_MAP_PORT;
		$fp = @fsockopen($fqdn, $port, $errnum, $errstr, 2);
		if (MINECRAFT_MAP_ONLINE_CHECK && !$fp){
			WCF::getTPL()->assign(array('checkMinecraftMapOnline' => false));
		}
		#print_r($errstr);
	}
	
	/**
	 * @see Page::show()
	 */
	public function show() {
		// set active menu item
		require_once(WCF_DIR.'lib/page/util/menu/PageMenu.class.php');
		PageMenu::setActiveMenuItem('wcf.header.menu.minecraft.map');
		
		// check module options
		if (!MODULE_MINECRAFT_MAP) {
			throw new IllegalLinkException();
		}
		
		// check permission
		WCF::getUser()->checkPermission('user.managepages.canViewMinecraftMap');

		parent::show();
	}	
}
?>