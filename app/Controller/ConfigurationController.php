<?php

class ConfigurationController extends AppController {

	public $components = array('Session', 'RequestHandler', 'Util');

	public function admin_index() {
		if($this->isConnected AND $this->User->isAdmin()) {
			$this->layout = "admin";

			if($this->request->is('post')) {
				foreach ($this->request->data as $key => $value) {
					if($key != "version" && $key != "social_btn" && $key != "social_btn_edited") {
						if($key == "banner_server") {
							$value = serialize($value);
						}
						$this->Configuration->set($key, $value);
						if($key == "mineguard") {
							if($value == "true") {
								$this->ServerComponent = $this->Components->load('Server');
								$this->ServerComponent->call(array('setMineguard' => 'true'), true);
							} else {
								$this->ServerComponent = $this->Components->load('Server');
								$this->ServerComponent->call(array('setMineguard' => 'false'), true);
							}
						}
					} elseif($key == "social_btn") { // si c'est pour les boutons sociaux personnalisés

						$this->loadModel('SocialButton');
						foreach ($value as $k => $v) { // on enregistre le tout
							$this->SocialButton->create();
							$this->SocialButton->set(array(
								'title' => $v['title'],
								'img' => $v['img'],
								'color' => $v['color'],
								'url' => $v['url']
							));
							$this->SocialButton->save();
						}

					} elseif($key == "social_btn_edited") { // si c'est pour les boutons sociaux personnalisés

						$this->loadModel('SocialButton');
						foreach ($value as $k => $v) { // on enregistre le tout
							$this->SocialButton->read(null, $v['id']);
							$this->SocialButton->set(array(
								'title' => $v['title'],
								'img' => $v['img'],
								'color' => $v['color'],
								'url' => $v['url']
							));
							$this->SocialButton->save();
						}

					}
				}

				$this->History->set('EDIT_CONFIGURATION', 'configuration');

				$this->Session->setFlash($this->Lang->get('EDIT_CONFIGURATION_SUCCESS'), 'default.success');
			}

			$config = $this->Configuration->get_all()['Configuration'];
			$this->loadModel('Server');
			$config['banner_server'] = unserialize($config['banner_server']);
			if(!empty($config['banner_server'])) {
				foreach ($config['banner_server'] as $key => $value) {
					$d = $this->Server->find('first', array('conditions' => array('id' => $value)));
					$selected_server[] = $d['Server']['id'];
				}
			} else {
				$selected_server = array();
			}
			$this->set(compact('selected_server'));

			$search_servers = $this->Server->find('all');
			if(!empty($search_servers)) {
				foreach ($search_servers as $v) {
					$servers[$v['Server']['id']] = $v['Server']['name'];
				}
			} else {
				$servers = array();
			}
			$this->set(compact('servers'));

			$this->set('config', $this->Configuration->get_all()['Configuration']);

			$this->set('shopIsInstalled', $this->EyPlugin->isInstalled('shop.1.eywek'));

			$this->loadModel('SocialButton');
			$this->set('social_buttons', $this->SocialButton->find('all'));
		} else {
			$this->redirect('/');
		}
	}
}
